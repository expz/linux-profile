#!/bin/sh
#
# mount-vm-share.sh
#
# Author: Jonathan Skowera
# Created: 2014-12-16
#
# Mounts the vm share from within the vm
#
#   the share is given a name within the virtualbox manager
#   the mount point directory must already exist
#
# Copy and paste the below line into /etc/rc.local
#
# OLD: Configure KDE to run this script after starting:
#
#   cp ~/bin/mount-vm-share.sh ~/.kde4/Autostart/
#

sharename='share-vm'
sharedir='/home/share/vm'

mount -t vboxsf -o ro $sharename $sharedir

