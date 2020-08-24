#!/bin/bash

# Requires python,curl
# On Debian sudo apt install python, curl
cd ~
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python get-pip.py --user
pip install virtualenv
git clone
python -m virtualenv ansible
source ansible/bin/activate
pip install ansible
