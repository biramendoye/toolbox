#!/bin/bash

# Demander les infos
read -p "Nom de domaine (ex: monsite.com) : " domain
read -p "Port de l'application (ex: 3000) : " app_port

# Définir les chemins
nginx_conf="/etc/nginx/sites-available/$domain"
nginx_link="/etc/nginx/sites-enabled/$domain"

# Installer Nginx si nécessaire
if ! command -v nginx &> /dev/null; then
    echo "Installation de Nginx..."
    sudo apt update
    sudo apt install -y nginx
fi

# Créer fichier de configuration Nginx
sudo tee "$nginx_conf" > /dev/null <<EOF
server {
    listen 80;
    server_name $domain www.$domain;

    location / {
        proxy_pass http://127.0.0.1:$app_port;
        proxy_http_version 1.1;
        proxy_set_header Upgrade \$http_upgrade;
        proxy_set_header Connection 'upgrade';
        proxy_set_header Host \$host;
        proxy_cache_bypass \$http_upgrade;
    }
}
EOF

# Activer la config
sudo ln -s "$nginx_conf" "$nginx_link"

sudo certbot --nginx -d $domain

# Vérifier et recharger Nginx
sudo nginx -t && sudo systemctl reload nginx

echo "✅ Reverse proxy configuré pour $domain → http://localhost:$app_port"
