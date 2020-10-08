Initialisation:

Créer un fichier nordvpn.env en se basant sur nordvpn.env_templateenv_template_azinchen

Pour créer et démarrer les containers vpn et test:

	docker-compose up -d

Pour arrêter et supprimer les containers vpn et test:

	docker-compose down


Sources: 
  - https://hub.docker.com/r/bubuntux/nordvpn/
  - https://github.com/bubuntux/nordvpn
	forked from dperson/openvpn-client
  - https://github.com/azinchen/nordvpn
  - https://support.nordvpn.com/Connectivity/Linux/1325531132/Installing-and-using-NordVPN-on-Debian-Ubuntu-Elementary-OS-and-Linux-Mint.htm

URL retrouves dans les logs:

	https://zwyr157wwiu6eior.com/v1/servers/countries
	https://zwyr157wwiu6eior.com/v1/users/services/credentials

Pour trouver l'adresse IP du réseau (NETWORK):

	ip route | awk '!/ (docker0|br-)/ && /src/ {print $1}'



Pour tester l'adresse IP fournie par NordVPN:
- Dans le container vpn

```bash
	docker exec -ti vpn bash

	root@vpn:/# curl ipinfo.io/ip
```
- Dans le container test

```bash
	docker exec -ti test bash

	root@test:/# curl ipinfo.io/ip
        #ou
        root@test:/# /tmp/getipaddr.sh
```

Il est possible de tester dans un nouveau container:

	docker run -it --net=container:vpn -d arm32v7/ubuntu


Info : Ne fonctionne plus au 07/10/2020, connexion impossible !  

    docker run -ti --cap-add=NET_ADMIN --cap-add=SYS_ADMIN --device /dev/net/tun --name vpn -p 8080:80 -e NETWORK=192.168.1.0/24 -e USER=user@email.com -e PASS='pas$word' -e CONNECT=France -e TECHNOLOGY=NordLynx -e TZ=Europe/Paris -d bubuntux/nordvpn 
    
On va donc modifier l'image du client nordvpn dans un premier temps:
bubuntux/nordvpn:latest -> azinchen/nordvpn:latest

Avantages azinchen/nordvpn aux premiers abords:
- choix automatique du vpn si pas de référence
- image plus légère: 22.8MB contre 193MB

Test: 

    docker run -ti --cap-add=NET_ADMIN --device /dev/net/tun --name vpn -p 8080:80 -e NETWORK=192.168.1.0/24 -e USER=user@email.com -e PASS='pas$word' -d azinchen/nordvpn

Sources: 
    
    https://github.com/bubuntux/nordvpn
    
TODO:
- retester la version rpi4 (branche arm32v7)
    