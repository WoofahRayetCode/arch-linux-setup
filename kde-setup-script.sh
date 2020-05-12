#!/bin/bash
set -e

yay -S cronie powerdevil steam discord telegram-desktop ark p7zip unrar obs-studio vlc qbittorrent libreoffice-fresh bleachbit thunderbird wine-staging neofetch kdenlive steamcmd lib32-mesa-aco-git mesa-aco-git foxitreader retroarch-git retroarch-assets-xmb-git pcsx2-git simplenote-electron-bin spotify minecraft-launcher teamviewer timeshift gamemode woeusb xdman gitkraken visual-studio-code-bin unityhub dotnet-runtime-bin dotnet-host-bin dotnet-sdk-bin 
sudo pacman -Rns $(pacman -Qtdq)
sudo pacman -Scc
yay -Scc
