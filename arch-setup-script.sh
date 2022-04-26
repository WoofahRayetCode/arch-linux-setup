#!/bin/bash
set -e

#Fully utilize the cpu
wget https://raw.githubusercontent.com/WoofahRayetCode/arch-linux-stuff/master/all-cpu-cores-compiling.sh
chmod +x all-cpu-cores-compiling.sh
./all-cpu-cores-compiling.sh

#For downloading and setting up Proton Updater for steam
wget https://raw.githubusercontent.com/Termuellinator/ProtonUpdater/master/cproton.sh
chmod +x cproton.sh
./cproton.sh

#File to regularly run to clean left over files
wget https://raw.githubusercontent.com/WoofahRayetCode/arch-linux-stuff/master/clean-files.sh
chmod +x clean-files.sh

#Remove icons I don't want on the programs menu
wget https://raw.githubusercontent.com/WoofahRayetCode/arch-linux-stuff/master/hide-icons.sh
chmod +x hide-icons.sh

#Enable parallel downloading
sudo sed -i 's/#ParallelDownloads/ParallelDownloads/g' /etc/pacman.conf

#Pacman output colorizating
sudo sed -i 's/#Color/Color/g' /etc/pacman.conf

#Change progressbar to pacman
sudo sed -i 's/VerbosePkgLists/VerbosePkgLists\nILoveCandy/g' /etc/pacman.conf

#Add Chaotic Aur
sudo pacman-key --recv-key FBA220DFC880C036 --keyserver keyserver.ubuntu.com
sudo pacman-key --lsign-key FBA220DFC880C036
pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst' 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'
sudo echo -e "\n[chaotic-aur]\nInclude = /etc/pacman.d/chaotic-mirrorlist" | sudo tee -a /etc/pacman.conf
sudo pacman -Syy

#Change update branch to Unstable
sudo pacman-mirrors --api --set-branch unstable
sudo pacman-mirrors --fasttrack 5
sudo pacman -Syyu

#Remove stuff
sudo pacman -Rns gwenview
sudo pacman -Rns okular
sudo pacman -Rns htop
sudo pacman -Rns ksysguard
sudo pacman -Rns plasma-systemmonitor
sudo pacman -Rns kcalc
sudo pacman -Rns kdeconnect
sudo pacman -Rns yakuake

#Main programs I use
sudo pacman -S alacritty github-desktop base-devel linux-headers git yay plasma-systemmonitor qbittorrent electron qt noisetorch shotcut obs-studio signal-desktop gamemode lib32-gamemode goverlay steam godot-git wine-ge-custom winetricks protontricks lutris discord telegram-desktop caprine krita libreoffice-fresh vlc bleachbit guvcview

#AUR Programs I use
yay -S duckstation-git pcsx2-git ppsspp-git mgba-qt-git melonds-git dolphin-emu-git libmgba-git xone-dkms-git jdownloader2 latte-dock-git

#To make sure programs can use the Nvidia GPU
nvidia-modprobe

#Clean leftover stuff
./clean-files.sh

#Hide icons
./hide-icons.sh
