#!/bin/bash

# Mise à jour des packages
echo "✅ Mise à jour des packages..."
sudo apt update && sudo apt upgrade -y

# Installation des dépendances nécessaires
echo "✅ Installation des dépendances nécessaires..."
sudo apt install curl build-essential libssl-dev -y

# Installation de NVM
echo "✅ Installation de NVM..."
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash

# Chargement de NVM (important pour que la commande nvm soit disponible)
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# Vérification de l'installation de NVM
echo "✅ Vérification de l'installation de NVM..."
nvm --version

# Installation de la dernière version de Node.js (stable)
echo "✅ Installation de la dernière version stable de Node.js..."
nvm install node

# Utilisation de la dernière version de Node.js par défaut
nvm alias default node

# Vérification de l'installation de Node.js et npm
echo "✅ Vérification de l'installation de Node.js et npm..."
node -v
npm -v

echo "🎉 Installation terminée ! NVM, Node.js, et npm sont installés avec succès."
