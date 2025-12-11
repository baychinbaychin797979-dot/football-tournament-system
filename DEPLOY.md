# Deploy WordPress Sage to VPS with Subdomain

## Prerequisites
- VPS with Ubuntu 20.04+ (or similar Linux)
- Domain with DNS access
- SSH access to VPS

## Quick Deploy Steps

### 1. Update Configuration

Edit `deploy.sh` and update these variables:
```bash
VPS_IP="YOUR_VPS_IP"              # Your VPS IP address
VPS_USER="root"                    # SSH user (usually root)
SUBDOMAIN="scores.yourdomain.com"  # Your subdomain
EMAIL="your-email@domain.com"      # For SSL certificate
```

### 2. Configure DNS

Go to your domain DNS management (Cloudflare, domain registrar, etc.) and add:

```
Type: A
Name: scores (or your subdomain prefix)
Value: YOUR_VPS_IP
TTL: Auto/3600
```

### 3. Run Deploy Script

**From Windows PowerShell (with Git Bash):**
```powershell
# Make script executable
chmod +x deploy.sh

# Run deployment
./deploy.sh
```

**Or manually via SSH:**
```bash
# On VPS
cd /var/www
git clone https://github.com/baychinbaychin797979-dot/wordpress-sage-project.git
cd wordpress-sage-project

# Copy production environment
cp .env.production .env

# Edit .env with your values
nano .env

# Update Nginx config
sed -i "s/YOUR_SUBDOMAIN_HERE/scores.yourdomain.com/g" nginx/conf.d/wordpress.conf

# Start containers
docker-compose -f docker-compose.prod.yml up -d

# Install dependencies and run migrations
docker exec wp_cli_prod sh -c "cd /var/www/html/wp-content/themes/sage && composer install"
docker exec wp_cli_prod sh -c "cd /var/www/html/wp-content/themes/sage && vendor/bin/acorn migrate"
docker exec wp_cli_prod sh -c "cd /var/www/html/wp-content/themes/sage && vendor/bin/acorn db:seed"
docker exec wp_cli_prod wp theme activate sage --allow-root

# Setup SSL
docker-compose -f docker-compose.prod.yml run --rm certbot certonly \
    --webroot \
    --webroot-path=/var/www/certbot \
    --email your-email@domain.com \
    --agree-tos \
    --no-eff-email \
    -d scores.yourdomain.com

# Enable HTTPS in Nginx (uncomment SSL block in wordpress.conf)
nano nginx/conf.d/wordpress.conf

# Restart Nginx
docker-compose -f docker-compose.prod.yml restart nginx
```

### 4. Verify Deployment

Visit: `https://scores.yourdomain.com`

## File Structure on VPS

```
/var/www/wordpress-sage-project/
├── docker-compose.prod.yml    # Production Docker config
├── .env                       # Environment variables
├── nginx/
│   ├── nginx.conf            # Main Nginx config
│   └── conf.d/
│       └── wordpress.conf    # Site-specific config
├── wp/                       # WordPress files
├── certbot/                  # SSL certificates
└── build-images/             # Docker build contexts
```

## Troubleshooting

### Check container status
```bash
docker-compose -f docker-compose.prod.yml ps
```

### View logs
```bash
docker-compose -f docker-compose.prod.yml logs -f
```

### Restart services
```bash
docker-compose -f docker-compose.prod.yml restart
```

### SSL certificate renewal (automatic via certbot container)
```bash
docker-compose -f docker-compose.prod.yml run --rm certbot renew
```

## Production Ports

- HTTP: 80 (redirects to HTTPS)
- HTTPS: 443
- MySQL: Internal only (not exposed)

## Security Notes

- MySQL is not exposed to the internet
- Strong passwords generated automatically in .env
- SSL/TLS enabled via Let's Encrypt
- Nginx acts as reverse proxy

## Updating the Site

```bash
# On your local machine
git add .
git commit -m "Update"
git push

# On VPS
cd /var/www/wordpress-sage-project
git pull
docker-compose -f docker-compose.prod.yml up -d --build
```
