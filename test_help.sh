#!/bin/bash

echo StlkrWlf1990 | sudo -S umount -l Games Storage WDMyCloudNAS
rmdir Games Storage WDMyCloudNAS
echo StlkrWlf1990 | sudo -S gedit /etc/fstab
echo StlkrWlf1990 | sudo -S gedit /etc/pacman.conf
yes | sudo pacman -S kdeconnect ksysguard yakuake htop

