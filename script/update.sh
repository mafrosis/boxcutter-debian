#!/bin/bash -eux

if [[ $UPDATE  =~ true || $UPDATE =~ 1 || $UPDATE =~ yes ]]; then
    echo "==> Updating list of repositories"
    apt-get -y update

    echo "==> Performing dist-upgrade (all packages and kernel)"
    apt-get -y dist-upgrade --force-yes

    #echo "==> Reboot"
    #reboot
    #echo "==> sleep 60"
    #sleep 60
else
    echo "==> Skipping dist-upgrade"
fi
