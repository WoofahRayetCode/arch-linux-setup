#!/bin/bash
set -e

#Completely shit on the cpu
wget https://raw.githubusercontent.com/WoofahRayetCode/arch-linux-stuff/master/all-cpu-cores-compiling.sh
chmod +x all-cpu-cores-compiling.sh
./all-cpu-cores-compiling.sh

#For downloading and setting up Proton Updater for steam
wget https://raw.githubusercontent.com/Termuellinator/ProtonUpdater/master/cproton.sh
chmod +x cproton.sh

#File to regularly run to clean left over files
wget https://raw.githubusercontent.com/WoofahRayetCode/arch-linux-stuff/master/clean-files.sh
chmod +x clean-files.sh

#Remove icons I don't want on the programs menu
wget https://raw.githubusercontent.com/WoofahRayetCode/arch-linux-stuff/master/hide-icons.sh
chmod +x hide-icons.sh

#Remove stuff
sudo pacman -Rns firefox
sudo pacman -Rns gwenview
sudo pacman -Rns okular
sudo pacman -Rns htop
sudo pacman -Rns ksysguard
sudo pacman -Rns plasma-systemmonitor
sudo pacman -Rns kcalc

#Main programs I use
sudo pacman -S base-devel git yay plasma-systemmonitor qbittorrent electron qt gamemode lib32-gamemode steam wine-staging winetricks lutris discord telegram-desktop krita libreoffice-fresh vlc bleachbit guvcview

#AUR Programs I use
yay -S duckstation-git pcsx2-git rpcs3-git ppsspp-git mgba-qt-git melonds-git citra-qt-git noisetorch-git freedownloadmanager unityhub goverlay protontricks minecraft-launcher steamcmd obs-studio-git davinci-resolve microsoft-edge-dev-bin signal-desktop-beta-bin etcher-bin bitwarden-bin dotnet-runtime-bin visual-studio-code-bin github-desktop-bin standardnotes-bin

#To make sure programs can use the Nvidia GPU
nvidia-modprobe

#Clean shit
./clean-files.sh

#Hide icons
./hide-icons.sh
