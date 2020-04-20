#!/bin/bash

set -e

yay -s nvidia nvidia-settings lib32-nvidia-utils steam steamcmd discord telegram-desktop ark p7zip unrar shotcut obs-studio vlc qbitrorrent retroarch-git retroarch-assets-xmb-git vscodium-bin simplenote-electron-bin spotify minecraft-launcher teamviewer timeshift gamemode woeusb firefox-nightly xdman libreoffice-fresh foxitreader unityhub stockfish pcsx2-git bleachbit gitkraken dotnet-runtime-bin dotnet-host-bin dotnet-sdk-bin thunderbird wine-staging neofetch kdenlive
sudo pacman -Rns $(pacman -Qtdq)
sudo pacman -Scc
yay -Scc
