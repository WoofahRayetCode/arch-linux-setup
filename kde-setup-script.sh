#!/bin/bash
set -e

yay -S steam discord telegram-desktop nemo-fileroller p7zip unrar vlc qbittorrent libreoffice-fresh bleachbit firefox thunderbird wine-staging neofetch steamcmd lib32-mesa-aco-git mesa-aco-git foxitreader retroarch-git retroarch-assets-xmb-git pcsx2-git simplenote-electron-bin dropbox pithos-git minecraft-launcher teamviewer timeshift gamemode woeusb gitkraken atom-editor-bin 
sudo pacman -Rns $(pacman -Qtdq)
sudo pacman -Scc
yay -Scc
