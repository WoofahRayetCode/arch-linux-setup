#!/bin/bash
set -e

#Command for main programs I use
sudo pacman -S nano nvidia nvidia-settings nvidia-utils lib32-nvidia-utils wine-staging firefox thunderbird qbittorrent krita bleachbit libreoffice-fresh git steam discord telegram-desktop obs-studio vlc unrar p7zip gparted 

#Command for downloading and setting up Proton Updater
cd Desktop
wget https://raw.githubusercontent.com/flubberding/ProtonUpdater/master/cproton.sh
chmod +x cproton.sh

#Command for programs I use from the AUR
yay -S retroarch-git retroarch-assets-xmb-git pcsx2-git minecraft-launcher teamviewer xdman pithos-git timeshift gamemode lib32-gamemode winetricks protontricks foxitreader davinci-resolve osu-lazer dotnet-sdk-bin dotnet-runtime-bin dotnet-host-bin aspnet-runtime-bin visual-studio-code-bin simplenote-electron-bin gitkraken

#Commands for cleaning left over files from main program install command and AUR install command.
sudo pacman -Rns $(pacman -Qtdq)
sudo pacman -Scc
yay -Scc
