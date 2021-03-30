#!/bin/bash
set -e

#Fully use CPU for compiling and compressing
wget https://raw.githubusercontent.com/WoofahRayetDev/general-linux-stuff/master/all-cpu-cores-compiling.sh
chmod +x all-cpu-cores-compiling.sh
./all-cpu-cores-compiling.sh

#Command for downloading and setting up Proton Updater
wget https://raw.githubusercontent.com/Termuellinator/ProtonUpdater/master/cproton.sh
chmod +x cproton.sh

#Main programs I use
sudo pacman -S base-devel yay obs-studio gamemode lib32-gamemode steam wine-staging lutris qbittorrent discord telegram-desktop krita libreoffice-fresh vlc bleachbit

#AUR Programs I use
yay -S protontricks-git winetricks-git retroarch-git retroarch-assets-git duckstation-git pcsx2-git rpcs3-git ppsspp-git vbam-git desmume-git citra-qt-git unityhub minecraft-launcher endless-sky steamcmd dxvk mangohud-common lib32-mangohud mangohud freedownloadmanager spotify foxitreader netstandard-targeting-pack-bin dotnet-targeting-pack-bin dotnet-sdk-bin visual-studio-code-bin github-desktop-bin etcher-bin minetime-bin standardnotes-bin davinci-resolve-studio

#Simply reboot computer
sudo reboot
