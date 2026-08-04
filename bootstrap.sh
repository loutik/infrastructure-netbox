#!/bin/bash

if [ -z "$1" ]; then
   # Demande le domaine pour le certificat SSL
   read -p "Entrez le nom de domaine pour le certificat SSL (ex: netbox.infra.loutik.fr): " DOMAIN
else
   DOMAIN=$1
fi

echo "Génération du certificat SSL pour le domaine: $DOMAIN"
mkdir -p ./nginx
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout ./nginx/nginx-selfsigned.key -out ./nginx/nginx-selfsigned.crt -subj "/CN=${DOMAIN}"