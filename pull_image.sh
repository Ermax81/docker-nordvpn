#!/bin/sh

# NordVpn official client in a docker. It makes routing containers traffic through NordVpn easy.
# Source: https://hub.docker.com/r/bubuntux/nordvpn/
docker pull bubuntux/nordvpn:armv7hf-latest

# Image to test
docker pull arm32v7/ubuntu:latest
