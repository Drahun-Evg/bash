#!/bin/bash

#debian's OS

#1) Ansible
echo --------- Starting Install Ansible ---------
PATH_ANSIBLE=/etc/ansible #The path where your config files will be located

sudo apt update
sudo apt install ansible -y
sudo mkdir "$PATH_ANSIBLE" #Creating a folder to describe config files
sudo touch "$PATH_ANSIBLE"/hosts #Creating files to describe hosts
sudo touch "$PATH_ANSIBLE"/ansible.cfg
sudo chmod 666 "$PATH_ANSIBLE"/ansible.cfg
sudo cat << EOF > "$PATH_ANSIBLE"/ansible.cfg
[defaults]
inventory = "$PATH_ANSIBLE"/hosts
host_key_checking = false
interpreter_python = /usr/bin/python3
EOF
ansible --version
echo ---------- Finish installing Ansible ----------

#2) Git
echo --------- Starting Install Git ---------
sudo apt update
sudo apt install -y git
git --version
echo --------- Finist Install Git ---------


#3) GitLab
YOUR_URL=http://gitlab-server.local

echo --------- Starting Install Gitlab ---------
sudo apt-get update
sudo apt-get install -y curl openssh-server ca-certificates perl
curl https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.deb.sh | sudo bash
sudo EXTERNAL_URL="$YOUR_URL" apt-get install gitlab-ce
echo  ---------- Finish installing GitLab ----------
