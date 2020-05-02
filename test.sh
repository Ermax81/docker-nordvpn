#!/bin/sh

# Script pour lancer un container pour y tester l'attribution d'une adresse IP au travers d'un autre container "vpn"
docker run -ti --rm --net=container:vpn -d arm32v7_ubuntu
