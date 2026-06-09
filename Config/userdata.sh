#!/bin/bash
# Mettre à jour les paquets du système (ce qui utilise ton NAT Gateway !)
sudo apt-get update -y
sudo apt-get upgrade -y

# Installer un serveur Web pour les tests
sudo apt-get install nginx -y

# Démarrer le service
sudo systemctl start nginx
sudo systemctl enable nginx

# Écrire un message personnalisé pour confirmer le succès
echo "<h1>AWS Multi-AZ VPC Demo - Private EC2 Successfully Configured</h1>" | sudo tee /var/www/html/index.html
