#!/bin/bash
set -e

yay -S steam steamcmd discord telegram-desktop ark p7zip unrar obs-studio vlc qbittorrent libreoffice-fresh bleachbit thunderbird wine-staging neofetch kdenlive lib32-mesa-aco-git mesa-aco-git foxitreader visual-studio-code-insiders retroarch-git retroarch-assets-xmb-git simplenote-electron-bin spotify minecraft-launcher teamviewer timeshift gamemode woeusb xdman unityhub pcsx2-git gitkraken dotnet-runtime-bin dotnet-host-bin dotnet-sdk-bin 
sudo pacman -Rns $(pacman -Qtdq)
sudo pacman -Scc
yay -Scc
