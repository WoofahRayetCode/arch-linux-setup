#!/bin/bash
set -e

#Set account info for git
git config --global user.email ericiparsley@hotmail.com
git config --global user.name WoofahRayetCode

#install parts for compiling aur stuff
sudo pacman -S base-devel linux-headers

#Grape the cpu so stuff compiles faster maybe?
wget https://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@raw.githubusercontent.com/WoofahRayetCode/arch-linux-stuff/master/grapethecpu.sh
sudo chmod +x grapethecpu.sh
sudo ./grapethecpu.sh

#File to regularly run to clean left over files
wget https://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@raw.githubusercontent.com/WoofahRayetCode/arch-linux-stuff/master/clean-files.sh
sudo chmod +x clean-files.sh

#Remove icons I don't want on the programs menu
wget https://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@raw.githubusercontent.com/WoofahRayetCode/arch-linux-stuff/master/hide-icons.sh
sudo chmod +x hide-icons.sh

#Enable parallel downloading
sudo sed -i 's/#ParallelDownloads/ParallelDownloads/g' /etc/pacman.conf

#Pacman output colorizating
sudo sed -i 's/#Color/Color/g' /etc/pacman.conf

#Change progressbar to pacman
sudo sed -i 's/VerbosePkgLists/VerbosePkgLists\nILoveCandy/g' /etc/pacman.conf

#Add ChaoticAur
sudo pacman-key --recv-key FBA220DFC880C036 --keyserver keyserver.ubuntu.com
sudo pacman-key --lsign-key FBA220DFC880C036
sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst' 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'
sudo echo -e "\n[chaotic-aur]\nInclude = /etc/pacman.d/chaotic-mirrorlist" | sudo tee -a /etc/pacman.conf
sudo pacman -Syy

sudo pacman -S nvidia nvidia-settings qt qt6 gnucash wine-staging winetricks lutris timeshift ark bleachbit partitionmanager discord telegram-desktop krita libreoffice-fresh kdenlive bluemail qbittorrent

yay -S duckstation-git pcsx2-git rpcs3-git ppsspp-git mgba-qt-git melonds-git citra-qt-git dolphin-emu-git yuzu-early-access minecraft-launcher an-anime-game-launcher-bin xone-dkms obs-studio-git visual-studio-code-bin ventoy-bin authy teamviewer noisetorch jdownloader2 vlc signal-desktop-beta onedrive-abraunegg onedrivegui-git nordvpn-bin

#Uninstall some apps
sudo pacman -Rns okular kdeconnect htop ksysguard

#To make sure programs can use the Nvidia GPU
nvidia-modprobe
