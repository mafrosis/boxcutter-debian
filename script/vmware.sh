#!/bin/bash -eux

SSH_USERNAME=${SSH_USERNAME:-vagrant}
VMWARE_TOOLS_VERSION=${VMWARE_TOOLS_VERSION:-8.1.1}

echo "${VMWARE_TOOLS_VERSION}" > /tmp/vmware_tools_version

if [[ $PACKER_BUILDER_TYPE =~ vmware ]]; then
    echo "==> Installing VMware Tools"
    apt-get install -y "linux-headers-$(uname -r)" build-essential perl git unzip

    cd /tmp || exit
    git clone https://github.com/rasa/vmware-tools-patches.git
    cd vmware-tools-patches || exit
    ./download-tools.sh "$VMWARE_TOOLS_VERSION"
    ./untar-and-patch-and-compile.sh
fi
