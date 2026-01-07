#!/bin/bash

# Update
sudo apt update
sudo apt -y upgrade

# Install packages
sudo apt -y install ffmpeg v4l-utils

# Install docker
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
sudo usermod -aG docker $USER
newgrp docker

# Setup mediamtx
docker pull bluenviron/mediamtx:1-ffmpeg

# Copy source files out
sudo cp pi_webcam.service /etc/systemd/system
sudo cp run_pi_webcam.sh /usr/local/bin
sudo cp mediamtx.yml /usr/local/bin
sudo systemctl daemon-reload
sudo systemctl enable pi_webcam.service
