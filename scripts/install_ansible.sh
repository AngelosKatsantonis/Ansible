#!/bin/bash

# Requires python3,curl
# On Debian sudo apt install python3, curl
cd ~
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python3 get-pip.py --user
pip3 install virtualenv
git clone https://github.com/AngelosKatsantonis/Ansible.git
python3 -m virtualenv ansible_env
source ansible_env/bin/activate
pip3 install ansible,boto3,boto
mkdir -p /etc/ansible
cp -R ansible/* /etc/ansible
