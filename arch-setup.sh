#!/bin/bash
set -e

#Remove some apps
sudo pacman -Rns htop kdeconnect ksysguard yakuake 

#Install and set up Git
sudo pacman -S git
git config --global user.email ericiparsley@hotmail.com
git config --global user.name WoofahRayetCode

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

#Download script for autostarting noisetorch
wget https://raw.githubusercontent.com/WoofahRayetCode/arch-linux-stuff/master/noisetorch_autostart.sh
chmod +x noisetorch_autostart.sh

#Enable parallel downloading
sudo sed -i 's/#ParallelDownloads/ParallelDownloads/g' /etc/pacman.conf

#Pacman output colorizating
sudo sed -i 's/#Color/Color/g' /etc/pacman.conf

#Change progressbar to pacman
sudo sed -i 's/VerbosePkgLists/VerbosePkgLists\nILoveCandy/g' /etc/pacman.conf

#Install regularly used apps
sudo pacman -S partitionmanager v4l2loopback-dkms wine-staging btop winetricks lutris bleachbit steam discord element-desktop telegram-desktop caprine signal-desktop krita libreoffice-fresh android-tools

#Emulators I use
yay -S duckstation-git pcsx2-git rpcs3-git ppsspp-git vita3k-git snes9x-git nestopia mgba-qt-git libmgba-git melonds-git citra-qt-git dolphin-emu-git cemu-git ryujinx-git yuzu-early-access retroarch-git

#install AUR apps that I use
yay -S mullvad-vpn onedrive-abraunegg protonup-qt antimicrox minecraft-launcher xpadneo-dkms-git obs-studio-git protonup-qt etcher-bin ventoy-bin teamviewer noisetorch-git streamdeck-ui android-messages-desktop-bin youtube-music-bin visual-studio-code-bin timeshift heroic-games-launcher microsoft-edge-stable-bin

#Clean left over files from AUR stuff
./clean-files.sh

#Hide icons in programs menu that I don't want to see
./hide-icons.sh
