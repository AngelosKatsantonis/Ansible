#!/bin/bash

sudo apt install python3
cd ~
python3 -m venv ansible_env
source ~/ansible_env/bin/activate
pip install --upgrade pip
pip install wheel
pip install boto
pip install boto3
pip install ansible
git clone https://github.com/AngelosKatsantonis/nsible.git
sudo ln -s ~/ansible /etc/
mkdir -p ~/.aws
cp Ansible/roles/setup_ansible/templates/awscreds.sh ~/.aws/
