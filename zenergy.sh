#!/bin/bash
set -e

cd
cd /home/ericparsley/Documents/Git
git clone https://github.com/BoukeHaarsma23/zenergy.git
cd zenergy
make
sudo make modules_install
make clean
sudo dkms add ../zenergy
