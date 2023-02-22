#!/bin/bash

#debian's OS

sudo apt-get install curl -y
sudo curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
sudo groupadd docker
sudo gpasswd -a $USER docker
newgrp docker
