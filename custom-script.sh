#!/usr/bin/env bash

set -eux

# Sample custom configuration script - add your own commands here
# to add some additional commands for your environment
#
# For example:
# yum install -y curl wget git tmux firefox xvfb

apt-get install -y curl


# bootstrap salt
bootstrap_salt() {
    echo '==> Installing Salt'
    if [[ ${SALT_VERSION:-} == 'latest' ]]; then
        echo 'Installing latest Salt version'
        curl -L http://bootstrap.saltstack.org | bash -s -- -X -d | grep -v copying | grep -v byte-compiling
    else
        echo "Installing Salt version $SALT_VERSION"
        curl -L http://bootstrap.saltstack.org | bash -s -- -X -d -P git "$SALT_VERSION" | grep -v copying | grep -v byte-compiling
    fi
}
bootstrap_salt


# display saltstack version message
function motd_saltstack {
	echo "==> Customizing message of the day for Saltstack"
	sed -i "/Debian GNU/a\ \ Saltstack $(sudo salt-call --version | cut -d\  -f 2,3)" /etc/motd
}
motd_saltstack


# display VMWare tools version message
function motd_vmware_tools {
	echo "==> Customizing message of the day for VMWare Tools"
	sed -i "/Saltstack/a\ \ open-vm-tools $(vmware-toolbox-cmd -v)" /etc/motd
}
motd_vmware_tools
