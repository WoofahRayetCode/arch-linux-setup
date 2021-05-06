#!/bin/bash
set -e

#Command for downloading and setting up Proton Updater
wget https://raw.githubusercontent.com/Termuellinator/ProtonUpdater/master/cproton.sh
chmod +x cproton.sh

#Main programs I use
sudo pacman -S git nvidia gamemode lib32-gamemode steam wine-staging winetricks lutris qbittorrent discord krita libreoffice-fresh vlc bleachbit

#Install yay
mkdir Git
cd Git
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

#AUR Programs I use
yay -S duckstation-git pcsx2-git rpcs3-git ppsspp-git vbam-git desmume-git citra-canary-git obs-studio-git protontricks minecraft-launcher steamcmd foxitreader mullvad-vpn bitwarden-bin davinci-resolve vscodium-bin vscodium-bin-marketplace github-desktop-bin etcher-bin minetime-bin standardnotes-bin 

#Simply reboot computer
sudo reboot
