#!/bin/sh

# NordVpn official client in a docker. It makes routing containers traffic through NordVpn easy.
# Source: https://hub.docker.com/r/bubuntux/nordvpn/  https://hub.docker.com/r/azinchen/nordvpn
#         https://github.com/azinchen/nordvpn
docker pull bubuntux/nordvpn:armv7hf-latest
docker pull azinchen/nordvpn:latest #OK

# Image to test
docker pull arm32v7/ubuntu:latest
docker pull alpine:latest   #OK
