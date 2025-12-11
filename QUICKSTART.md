# Quick Deploy Guide for livebongda.nexo.io.vn

## 1. DNS Configuration (DO THIS FIRST!)

Go to your DNS management for `nexo.io.vn` and add:

```
Type: A
Name: livebongda
Value: 103.173.227.230
TTL: 3600 (or Auto)
```

**Wait 5-10 minutes for DNS to propagate before deploying!**

Verify DNS: `ping livebongda.nexo.io.vn` should show `103.173.227.230`

## 2. Deploy from Windows

### Option A: Using deploy.sh (Recommended)

```powershell
# Install Git Bash if you don't have it
# Then run:
bash deploy.sh
```

### Option B: Manual Deploy

```powershell
# 1. Commit and push to GitHub
git add .
git commit -m "Production ready"
git push origin main

# 2. SSH to VPS
ssh root@103.173.227.230

# 3. On VPS, run:
cd /var/www
git clone https://github.com/baychinbaychin797979-dot/wordpress-sage-project.git wordpress-sage
cd wordpress-sage

# 4. Create .env file
cat > .env << 'EOF'
MYSQL_ROOT_PASSWORD=$(openssl rand -base64 32)
WORDPRESS_DB=wordpress_production
WORDPRESS_DB_USER=wordpress_prod
WORDPRESS_DB_PASSWORD=$(openssl rand -base64 32)
WORDPRESS_TABLE_PREFIX=wp_
WORDPRESS_DEBUG=false
EOF

# 5. Start containers
docker-compose up -d

# 6. Install WordPress & theme
docker exec wp_cli sh -c "cd /var/www/html/wp-content/themes/sage && composer install"
docker exec wp_cli sh -c "cd /var/www/html/wp-content/themes/sage && vendor/bin/acorn migrate"
docker exec wp_cli sh -c "cd /var/www/html/wp-content/themes/sage && vendor/bin/acorn db:seed"
docker exec wp_cli wp theme activate sage --allow-root

# 7. Get SSL certificate (after DNS is working)
docker-compose run --rm certbot certonly \
    --webroot \
    --webroot-path=/var/www/certbot \
    --email admin@nexo.io.vn \
    --agree-tos \
    --no-eff-email \
    -d livebongda.nexo.io.vn

# 8. Restart Nginx
docker-compose restart nginx
```

## 3. Verify

Visit: https://livebongda.nexo.io.vn

## Troubleshooting

### Check DNS
```bash
nslookup livebongda.nexo.io.vn
ping livebongda.nexo.io.vn
```

### Check containers
```bash
ssh root@103.173.227.230
cd /var/www/wordpress-sage
docker-compose ps
docker-compose logs -f
```

### Restart services
```bash
docker-compose restart
```

## Update Site Later

```bash
# On VPS
cd /var/www/wordpress-sage
git pull
docker-compose restart
```
