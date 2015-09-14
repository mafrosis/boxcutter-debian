#!/usr/bin/env bash

set -eux

# Sample custom configuration script - add your own commands here
# to add some additional commands for your environment
#
# For example:
# yum install -y curl wget git tmux firefox xvfb

# install gitfs
function saltstack_gitfs {
	# Jessie currently has libgit2 v0.21.1
	# https://packages.debian.org/jessie/libgit2-21
	# We must install the correct version from pip

	echo '==> Installing git, pip and pygit2'
	apt-get install -y git python-pip libgit2-21 build-essential python-dev libffi-dev libgit2-dev
	pip install -U pip pygit2==0.21.4
}
saltstack_gitfs
