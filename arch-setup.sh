#!/bin/bash
set -e

#Uninstall some apps
#sudo pacman -Rns firefox okular kdeconnect htop ksysguard

#Set account info for git
git config --global user.email ericiparsley@hotmail.com
git config --global user.name WoofahRayetCode

#install parts for compiling aur stuff
sudo pacman -S base-devel linux-headers

#Grape the cpu so stuff compiles faster maybe?
wget https://raw.githubusercontent.com/WoofahRayetCode/arch-linux-stuff/master/grapethecpu.sh
sudo chmod +x grapethecpu.sh
sudo ./grapethecpu.sh

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

#Add Chaotic Aur
sudo pacman-key --recv-key FBA220DFC880C036 --keyserver keyserver.ubuntu.com
sudo pacman-key --lsign-key FBA220DFC880C036
sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst' 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'
sudo echo -e "\n[chaotic-aur]\nInclude = /etc/pacman.d/chaotic-mirrorlist" | sudo tee -a /etc/pacman.conf
sudo pacman -Syy

#Install regularly used apps
sudo pacman -S bluez bluez-utils bluedevil wine-staging winetricks lutris bleachbit partitionmanager steam discord krita libreoffice-fresh kdenlive qbittorrent android-tools

#install AUR apps that I use
yay -S duckstation-git pcsx2-git rpcs3-git ppsspp-git vita3k-git mgba-qt-git libmgba-git melonds-git citra-qt-git dolphin-emu-git cemu-git ryujinx-git retroarch-git protonup-qt minecraft-launcher xone-dkms obs-studio-git ventoy-bin teamviewer noisetorch streamdeck-ui android-messages-desktop-bin youtube-music-bin

#For cemu-git
yay -S zarchive-git

#Start bluetooth service
systemctl start bluetooth.service
systemctl enable bluetooth.service

#Run to make teamviewer work
sudo systemctl start teamviewerd
sudo systemctl enable teamviewerd

#Clean left over files from AUR stuff
./clean-files.sh

#Hide icons in programs menu that I don't want to see
./hide-icons.sh
