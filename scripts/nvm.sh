#!/bin/bash

echo "🔧 Installation de NVM (Node Version Manager)..."

# Téléchargement et exécution du script d'installation officiel
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

# Définition du répertoire NVM
export NVM_DIR="$HOME/.nvm"

# Chargement dans le shell actuel (utile si on veut enchaîner d'autres commandes)
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# Ajout au fichier de configuration .bashrc
if [ -n "$BASH_VERSION" ] && ! grep -q 'nvm.sh' ~/.bashrc; then
  echo 'export NVM_DIR="$HOME/.nvm"' >> ~/.bashrc
  echo '[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"' >> ~/.bashrc
  echo '[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"' >> ~/.bashrc
fi

# Ajout au fichier de configuration .zshrc
if [ -n "$ZSH_VERSION" ] || [ -f ~/.zshrc ]; then
  if ! grep -q 'nvm.sh' ~/.zshrc; then
    echo 'export NVM_DIR="$HOME/.nvm"' >> ~/.zshrc
    echo '[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"' >> ~/.zshrc
    echo '[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"' >> ~/.zshrc
  fi
fi

echo "✅ NVM installé avec succès !"
echo "👉 Redémarre ton terminal ou fais :"
echo "   - source ~/.bashrc   (si tu utilises Bash)"
echo "   - source ~/.zshrc    (si tu utilises Zsh)"
echo "Ensuite, installe Node.js avec : nvm install --lts"
