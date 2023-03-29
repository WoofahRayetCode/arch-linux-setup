#!/bin/bash
set -e

#Remove some apps
sudo pacman -Rns vim htop

#Install and set up Git
sudo pacman -S git
git config --global user.email ericiparsley@hotmail.com
git config --global user.name WoofahRayetCode

#Install yay
#Dont forget to edit /etc/makepkg.conf and set MAKEFLAGS="-j16"
mkdir Git
cd Git
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd

#install parts for compiling aur stuff
sudo pacman -S base-devel linux-headers

#Download file for easily fixing database lock issue
wget https://raw.githubusercontent.com/WoofahRayetCode/arch-linux-stuff/master/database-unlock.sh
chmod +x database-unlock.sh

#File to regularly run to clean left over files
wget https://raw.githubusercontent.com/WoofahRayetCode/arch-linux-stuff/master/clean-files.sh
sudo chmod +x clean-files.sh

#Remove icons I don't want on the programs menu
wget https://raw.githubusercontent.com/WoofahRayetCode/arch-linux-stuff/master/hide-icons.sh
sudo chmod +x hide-icons.sh

#Enable parallel downloading
sudo sed -i 's/#ParallelDownloads/ParallelDownloads/g' /etc/pacman.conf

#Pacman output colorizating
sudo sed -i 's/#Color/Color/g' /etc/pacman.conf

#Change progressbar to pacman
sudo sed -i 's/VerbosePkgLists/VerbosePkgLists\nILoveCandy/g' /etc/pacman.conf

#Install regularly used apps
sudo pacman -S bluez bluez-utils bluedevil spectacle partitionmanager wine-staging winetricks lutris bleachbit steam discord telegram-desktop caprine signal-desktop krita libreoffice-fresh android-tools

#For C# stuff
yay -S dotnet-runtime dotnet-sdk

#For cemu-git
yay -S zarchive-git

#install AUR apps that I use
yay -S duckstation-git pcsx2-git rpcs3-git ppsspp-git vita3k-git mgba-qt-git libmgba-git melonds-git citra-qt-git dolphin-emu-git cemu-git ryujinx-git retroarch-git pamac-aur protonup-qt goverlay antimicrox minecraft-launcher xone-dkms obs-studio-git ventoy-bin teamviewer noisetorch-git streamdeck-ui android-messages-desktop-bin youtube-music-bin

#Start bluetooth service
systemctl start bluetooth.service
systemctl enable bluetooth.service

#Run to make teamviewer work
systemctl start teamviewerd
systemctl enable teamviewerd

#Clean left over files from AUR stuff
./clean-files.sh

#Hide icons in programs menu that I don't want to see
./hide-icons.sh
