#!/bin/bash

# Nom du script : install_jenkins.sh
# Description : Script d'installation automatique de Jenkins sur Debian/Ubuntu

echo "-------------------------------"
echo " Installation de Jenkins "
echo "-------------------------------"

# Mise à jour des paquets
echo "Mise à jour des paquets..."
sudo apt update -y

# Installation de Java (OpenJDK 11)
echo "Installation de OpenJDK 11..."
sudo apt install openjdk-11-jdk -y

# Ajouter la clé GPG officielle de Jenkins de manière sécurisée
echo "Ajout de la clé GPG officielle de Jenkins..."
curl -fsSL https://pkg.jenkins.io/debian/jenkins.io-2023.key | sudo tee \
/usr/share/keyrings/jenkins-keyring.asc > /dev/null

# Ajouter le dépôt Jenkins à la liste des sources
echo "Ajout du dépôt Jenkins à la liste des sources..."
echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/" | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null

# Mise à jour des paquets après ajout du dépôt Jenkins
echo "Mise à jour des paquets après ajout du dépôt Jenkins..."
sudo apt update -y

# Installation de Jenkins
echo "Installation de Jenkins..."
sudo apt install jenkins -y

# Démarrage de Jenkins
echo "Démarrage de Jenkins..."
sudo systemctl start jenkins
sudo systemctl enable jenkins

# Vérification du statut de Jenkins
echo "Vérification de l'état de Jenkins..."
sudo systemctl status jenkins

# Affichage du mot de passe initial de Jenkins
echo "Récupération du mot de passe initial de Jenkins..."
if [ -f /var/lib/jenkins/secrets/initialAdminPassword ]; then
    sudo cat /var/lib/jenkins/secrets/initialAdminPassword
else
    echo "Le fichier du mot de passe initial n'a pas été trouvé. Assurez-vous que Jenkins est bien installé."
fi

echo "-------------------------------"
echo " Jenkins installé avec succès !"
echo " Accède à Jenkins via : http://localhost:8080"
echo "-------------------------------"
