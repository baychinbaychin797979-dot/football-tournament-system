#!/bin/bash

# Deploy script for VPS
# Usage: ./deploy.sh

set -e

echo "=== WordPress Sage Project Deployment ==="

# Variables - UPDATE THESE
VPS_IP="103.173.227.230"
VPS_USER="root"
SUBDOMAIN="livebongda.nexo.io.vn"
EMAIL="admin@nexo.io.vn"
PROJECT_DIR="/var/www/wordpress-sage"

# Colors
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo -e "${YELLOW}Step 1: Checking VPS connection...${NC}"
ssh $VPS_USER@$VPS_IP "echo 'Connected successfully'"

echo -e "${YELLOW}Step 2: Installing Docker & Docker Compose on VPS...${NC}"
ssh $VPS_USER@$VPS_IP << 'ENDSSH'
    # Update system
    apt-get update
    
    # Install Docker
    if ! command -v docker &> /dev/null; then
        curl -fsSL https://get.docker.com -o get-docker.sh
        sh get-docker.sh
        systemctl start docker
        systemctl enable docker
        echo "Docker installed"
    else
        echo "Docker already installed"
    fi
    
    # Install Docker Compose
    if ! command -v docker-compose &> /dev/null; then
        curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
        chmod +x /usr/local/bin/docker-compose
        echo "Docker Compose installed"
    else
        echo "Docker Compose already installed"
    fi
ENDSSH

echo -e "${YELLOW}Step 3: Creating project directory...${NC}"
ssh $VPS_USER@$VPS_IP "mkdir -p $PROJECT_DIR"

echo -e "${YELLOW}Step 4: Uploading project files...${NC}"
rsync -avz --progress \
    --exclude 'node_modules' \
    --exclude '.git' \
    --exclude 'wp/wp-content/uploads' \
    --exclude '.env' \
    ./ $VPS_USER@$VPS_IP:$PROJECT_DIR/

echo -e "${YELLOW}Step 5: Setting up environment file...${NC}"
ssh $VPS_USER@$VPS_IP << ENDSSH
    cd $PROJECT_DIR
    
    # Create .env file
    cat > .env << 'EOF'
MYSQL_ROOT_PASSWORD=\$(openssl rand -base64 32)
WORDPRESS_DB=wordpress_production
WORDPRESS_DB_USER=wordpress_prod
WORDPRESS_DB_PASSWORD=\$(openssl rand -base64 32)
WORDPRESS_TABLE_PREFIX=wp_
WORDPRESS_DEBUG=false
DOMAIN=livebongda.nexo.io.vn
EMAIL=admin@nexo.io.vn
EOF
ENDSSH

echo -e "${YELLOW}Step 6: Starting Docker containers...${NC}"
ssh $VPS_USER@$VPS_IP << ENDSSH
    cd $PROJECT_DIR
    
    # Add Nginx container to docker-compose if not exists
    if ! grep -q "nginx:" docker-compose.yml; then
        cat >> docker-compose.yml << 'NGINX_EOF'

  nginx:
    image: nginx:alpine
    container_name: wp_nginx
    restart: always
    ports:
      - "80:80"
      - "443:443"
    volumes:
      - ./nginx-site.conf:/etc/nginx/conf.d/default.conf:ro
      - ./certbot/conf:/etc/letsencrypt:ro
      - ./certbot/www:/var/www/certbot:ro
    depends_on:
      - wordpress

  certbot:
    image: certbot/certbot
    container_name: wp_certbot
    volumes:
      - ./certbot/conf:/etc/letsencrypt
      - ./certbot/www:/var/www/certbot
    entrypoint: "/bin/sh -c 'trap exit TERM; while :; do certbot renew; sleep 12h & wait \$\${!}; done;'"
NGINX_EOF
    fi
    
    docker-compose up -d
ENDSSH

echo -e "${YELLOW}Step 7: Running database migrations and seeders...${NC}"
ssh $VPS_USER@$VPS_IP << 'ENDSSH'
    cd $PROJECT_DIR
    docker exec wp_cli_prod sh -c "cd /var/www/html/wp-content/themes/sage && composer install"
    docker exec wp_cli_prod sh -c "cd /var/www/html/wp-content/themes/sage && vendor/bin/acorn migrate"
    docker exec wp_cli_prod sh -c "cd /var/www/html/wp-content/themes/sage && vendor/bin/acorn db:seed"
    docker exec wp_cli_prod wp theme activate sage --allow-root
ENDSSH

echo -e "${YELLOW}Step 8: Setting up SSL certificate...${NC}"
ssh $VPS_USER@$VPS_IP << ENDSSH
    cd $PROJECT_DIR
    
    # Get initial certificate
    docker-compose run --rm certbot certonly \
        --webroot \
        --webroot-path=/var/www/certbot \
        --email admin@nexo.io.vn \
        --agree-tos \
        --no-eff-email \
        -d livebongda.nexo.io.vn
    
    # Reload Nginx
    docker-compose restart nginx
ENDSSH

echo -e "${GREEN}=== Deployment Complete! ===${NC}"
echo -e "${GREEN}Your website is available at: https://livebongda.nexo.io.vn${NC}"
echo ""
echo "Next steps:"
echo "1. Point your DNS A record: livebongda.nexo.io.vn -> 103.173.227.230"
echo "2. Wait for DNS propagation (5-30 minutes)"
echo "3. Visit https://livebongda.nexo.io.vn"
