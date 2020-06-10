#!/bin/bash
set -e

#Commands for main programs I use
sudo pacman -S nvidia nvidia-settings lib32-nvidia-utils wine-staging firefox thunderbird qbittorrent krita cups cups-pdf print-manager bleachbit libreoffice-fresh git steam discord telegram-desktop obs-studio vlc powerdevil unrar p7zip ark gparted 

#Command for downloading and setting up Proton Updater
cd Desktop
wget https://raw.githubusercontent.com/flubberding/ProtonUpdater/master/cproton.sh
chmod +x cproton.sh
./cproton.sh -l
#./cproton.sh *lastest stable version* to install

#Commands for starting printer service and letting it auto start at bootup
sudo systemctl disable org.cups.cupsd.service
sudo systemctl enable org.cups.cupsd.service
sudo systemctl restart org.cups.cupsd.service

#Command for program I use from the AUR
yay S retroarch-git retroarch-assets-xmb-git pcsx2-git minecraft-launcher teamviewer xdman dropbox pithos-git timeshift gamemode lib32-gamemode winetricks protontricks foxitreader davinci-resolve osu-lazer dotnet-sdk-bin dotnet-runtime-bin dotnet-host-bin aspnet-runtime-bin visual-studio-code-bin simplenote-electron-bin gitkraken

#Commands for cleaning left over files from main program install command and AUR install command.
sudo pacman -Rns $(pacman -Qtdq)
sudo pacman -Scc
yay -Scc
