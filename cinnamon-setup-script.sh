#!/bin/bash
set -e

yay -S steam steamcmd discord telegram-desktop p7zip unrar obs-studio vlc qbittorrent kdenlive neofetch wine-staging thunderbird bleachbit libreoffice-fresh dropbox lib32-mesa-aco-git mesa-aco-git retroarch-git retroarch-assets-xmb-git visual-studio-code-bin simplenote-electron-bin spotify minecraft-launcher teamviewer gamemode woeusb foxitreader pcsx2-git gitkraken dotnet-runtime-bin dotnet-host-bin dotnet-sdk-bin
sudo pacman -Rns $(pacman -Qtdq)
sudo pacman -Scc
yay -Scc
