#!/bin/bash
set -e

cd
cd Git
git clone https://github.com/BoukeHaarsma23/zenergy.git
cd zenergy
make
sudo make modules_install
make clean
sudo dkms add ../zenergy
cd 
cd ..
cd ..
cd usr/src/zenergy-\@VERSION\@/
sudo dkms build -m zenergy.c