#!/bin/bash
set -e

#Uninstall some apps
sudo pacman -Rns firefox okular kdeconnect htop ksysguard

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

#Add ChaoticAur
sudo pacman-key --recv-key FBA220DFC880C036 --keyserver keyserver.ubuntu.com
sudo pacman-key --lsign-key FBA220DFC880C036
sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst' 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'
sudo echo -e "\n[chaotic-aur]\nInclude = /etc/pacman.d/chaotic-mirrorlist" | sudo tee -a /etc/pacman.conf
sudo pacman -Syy

#Install regularly used apps
sudo pacman -S yay nvidia powerpill wine-staging winetricks lutris timeshift ark bleachbit bitwarden partitionmanager steam discord telegram-desktop caprine krita libreoffice-fresh kdenlive bluemail qbittorrent android-tools

#Currently needed to compile cemu-git
yay -S discord-rpc-git cubeb-git zarchive-git fmt-git

#install AUR apps that I use
yay -S duckstation-git pcsx-redux-git pcsx2-git rpcs3-git ppsspp-git vita3k-git mgba-qt-git libmgba-git melonds-git citra-qt-git dolphin-emu-git cemu-git yuzu-early-access ryujinx-ava retroarch-git protonup-qt minecraft-launcher an-anime-game-launcher-bin heroic-games-launcher-bin xone-dkms obs-studio-git visual-studio-code-bin github-desktop-bin ventoy-bin authy teamviewer noisetorch jdownloader2 microsoft-edge-stable-bin vlc signal-desktop-beta zoom onedrive-abraunegg onedrivegui-git

#Run to make teamviewer work
sudo systemctl start teamviewerd
sudo systemctl enable teamviewerd

#Clean left over files from AUR stuff
./clean-files.sh

#Hide icons in programs menu that I don't want to see
./hide-icons.sh

#To make sure programs can use the Nvidia GPU
nvidia-modprobe
