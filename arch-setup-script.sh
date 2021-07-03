#!/bin/bash
set -e

#Completely shit on the cpu
wget https://raw.githubusercontent.com/WoofahRayetCode/arch-linux-stuff/master/all-cpu-cores-compiling.sh
chmod +x all-cpu-cores-compiling.sh
./all-cpu-cores-compiling.sh

#Command for downloading and setting up Proton Updater for steam
wget https://raw.githubusercontent.com/Termuellinator/ProtonUpdater/master/cproton.sh
chmod +x cproton.sh

sudo pacman -Rns ksysguard
sudo pacman -Rns konsole

#Main programs I use
sudo pacman -S base-devel alacritty qt gamemode lib32-gamemode steam wine-staging winetricks lutris discord krita libreoffice-fresh vlc bleachbit

#AUR Programs I use
yay -S duckstation-git pcsx2-git rpcs3-git ppsspp-git mgba-qt-git desmume-git citra-qt-git protontricks minecraft-launcher steamcmd signal-desktop-beta-bin bitwarden-bin vscodium-bin vscodium-bin-marketplace github-desktop-bin standardnotes-bin

#Remove icons cuz OCD :s
cd /usr/share/applications
sudo rm -f assistant.desktop 
sudo rm -f designer.desktop
sudo rm -f linguist.desktop
sudo rm -f qdbusviewer.desktop
sudo rm -f uxterm.desktop
sudo rm -f xterm.desktop
sudo rm -f UserFeedbackConsole.desktop
sudo rm -f org.kde.plasma.emojier.desktop
sudo rm -f avahi-discover.desktop
sudo rm -f lstopo.desktop
sudo rm -f qv4l2.desktop
sudo rm -f qvidcap.desktop
cd

#To make sure program can use the Nvidia GPU
nvidia-modprobe

#Clean shit
sudo pacman -Rns $(pacman -Qtdq)
sudo pacman -Scc
yay -Scc
rm -rf ~/.cache/*

#Restart
sudo restart
