#!/bin/bash -eux

if [[ $PACKER_BUILDER_TYPE =~ vmware ]]; then
    echo "==> Installing Open VM Tools"
    apt-get install -y open-vm-tools
fi
