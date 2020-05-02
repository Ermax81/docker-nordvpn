Initialisation:

	Créer un fichier nordvpn.env en se basant sur nordvpn.env_template

Pour créer et démarrer les containers vpn et test:

	docker-compose up -d

Pour arrêter et supprimer les containers vpn et test:

	docker-compose down


Source: https://hub.docker.com/r/bubuntux/nordvpn/
	https://github.com/bubuntux/nordvpn
	forked from dperson/openvpn-client

URL retrouves dans les logs:

	https://zwyr157wwiu6eior.com/v1/servers/countries
	https://zwyr157wwiu6eior.com/v1/users/services/credentials

Pour trouver l'adresse IP du réseau (NETWORK):

	ip route | awk '!/ (docker0|br-)/ && /src/ {print $1}'



Pour tester l'adresse IP fournie par NordVPN:

	docker exec -ti vpn bash

	root@vpn:/# curl ipinfo.io/ip
