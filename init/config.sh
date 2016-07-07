#!/bin/sh
#
# Fedora Workstation 23 Setup: Configuration Variables
#

#############################
#
# setup-fedora-root-1
#
#############################


export FEDORA_VERSION=24
# used for packages which are not yet released for the newest version of fedora
export FEDORA_FALLBACK_VERSION=23

export VIRTUALBOX_MAJOR_VERSION=5.0
export NON_ROOT_USER=user

export HOSTNAME=fedora
export DOMAINNAME=lab.local
export ROUTER_IP=10.0.80.1
export ROUTER_HOSTNAME=wally


#############################
#
# setup-fedora-root-2
#
#############################

export ZFS_VERSION=0.6.5.7

# default=fedora
export ZFS_VOLGROUP=fedora

# default=root
export ZFS_VOLNAME=root


#############################
#
# setup-fedora-user
#
#############################

export SSH_EMAIL="email@example.com"

export GIT_NAME="Firstname Lastname"
export GIT_EMAIL="email@example.com"
