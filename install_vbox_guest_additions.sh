#!/usr/bin/env bash

vagrant ssh<<'ENDSSH'

sudo apt-get install -y build-essential linux-headers-`uname -r` dkms

# Mind the VirtualBox version you're using
wget http://download.virtualbox.org/virtualbox/5.0.12/VBoxGuestAdditions_5.0.12.iso
sudo mkdir /media/VBoxGuestAdditions
sudo mount -o loop,ro VBoxGuestAdditions_5.0.12.iso /media/VBoxGuestAdditions

sudo sh /media/VBoxGuestAdditions/VBoxLinuxAdditions.run
rm VBoxGuestAdditions_5.0.12.iso
sudo umount /media/VBoxGuestAdditions
sudo rmdir /media/VBoxGuestAdditions
exit
ENDSSH

vagrant halt

# Now it should work
vagrant up
