#!/bin/bash
set -e

yay -S alacritty 
yay -S steam 
yay -S discord 
yay -S telegram-desktop
yay -S cups
yay -S cups-pdf
yay -S system-config-printer 
yay -S vlc 
yay -S qbittorrent 
yay -S libreoffice-fresh 
yay -S bleachbit 
yay -S thunderbird 
yay -S wine-staging 
yay -S neofetch 
yay -S winetricks 
yay -S obs-studio-git 
yay -S steamcmd 
yay -Slib32-mesa-aco-git 
yay -S mesa-aco-git 
yay -S foxitreader 
yay -S retroarch-git 
yay -S libretro-shaders-all-git 
yay -S libretro-overlays-git 
yay -S retroarch-assets-xmb-git 
yay -S pcsx2-git 
yay -S simplenote-electron-bin 
yay -S atom-editor-bin 
yay -S dropbox pithos-git 
yay -S minecraft-launcher 
yay -S teamviewer 
yay -S timeshift 
yay -S gamemode 
yay -S woeusb 
yay -S gitkraken 

sudo pacman -Rns $(pacman -Qtdq)

sudo pacman -Scc

yay -Scc
