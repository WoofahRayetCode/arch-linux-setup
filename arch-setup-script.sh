#!/bin/bash
set -e

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

#Main programs I use
sudo pacman -S alacritty github-desktop base-devel wine-staging linux-headers git qbittorrent bitwarden electron qt shotcut obs-studio signal-desktop gamemode lib32-gamemode steam goverlay winetricks protontricks lutris discord telegram-desktop krita libreoffice-fresh strawberry vlc bleachbit guvcview

#Install yay
mkdir Git
cd Git
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

#AUR Programs I use
yay -S duckstation-git pcsx2-git ppsspp-git mgba-qt-git melonds-git libmgba-git xone-dkms ckb-next an-anime-game-launcher-bin jdownloader2 audiotube-git authy balena-etcher bluemail dosbox-staging dropbox vscodium-bin vscodium-bin-marketplace vscodium-bin-features minecraft-launcher protonup-qt
#To make sure programs can use the Nvidia GPU
nvidia-modprobe

#Clean leftover stuff
./clean-files.sh

#Hide icons
./hide-icons.sh
