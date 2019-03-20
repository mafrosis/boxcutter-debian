#!/bin/bash -eux

echo '==> Installing python-gnupg'
apt-get install -y python-pip
pip install -U pip python-gnupg
