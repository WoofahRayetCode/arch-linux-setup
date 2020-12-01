#!/bin/bash
set -e

#Fully use CPU for compiling and compressing
wget https://raw.githubusercontent.com/WoofahRayetDev/general-linux-stuff/master/all-cpu-cores-compiling.sh
chmod +x all-cpu-cores-compiling.sh
./all-cpu-cores-compiling.sh

#Set iwd as wifi backend
wget https://raw.githubusercontent.com/WoofahRayetDev/general-linux-stuff/master/wifi_backend.conf
mv wifi_backend.conf /etc/NetworkManager/conf.d/

#Remove unwanted programs
sudo pacman -Rns vim

#Command for main programs I use
sudo pacman -S iwd qt nvidia nvidia-settings lib32-nvidia-utils nvidia-utils bumblebee primus lib32-primus powerdevil nano gamemode lib32-gamemode wine-staging thunderbird qbittorrent krita obs-studio kdenlive vlc bleachbit libreoffice-fresh git steam lutris discord telegram-desktop ark unrar p7zip

#Remove some unwanted icons from program menu. THANKS OCD :D
mkdir UnwantedIcons
sudo mv /usr/share/applications/assistant.desktop /home/ericparsley/UnwantedIcons
sudo mv /usr/share/applications/designer.desktop /home/ericparsley/UnwantedIcons
sudo mv /usr/share/applications/linguist.desktop /home/ericparsley/UnwantedIcons
sudo mv /usr/share/applications/qdbusviewer.desktop /home/ericparsley/UnwantedIcons
sudo mv /usr/share/applications/UserFeedbackConsole.desktop /home/ericparsley/UnwantedIcons
sudo mv /usr/share/applications/uxterm.desktop /home/ericparsley/UnwantedIcons
sudo mv /usr/share/applications/xterm.desktop /home/ericparsley/UnwantedIcons
sudo mv /usr/share/applications/teamviewerapi.desktop /home/ericparsley/UnwantedIcons
sudo mv /usr/share/applications/lstopo.desktop /home/ericparsley/UnwantedIcons
sudo mv /usr/share/applications/bssh.desktop /home/ericparsley/UnwantedIcons
sudo mv /usr/share/applications/bvnc.desktop /home/ericparsley/UnwantedIcons
sudo mv /usr/share/applications/avahi-discover.desktop /home/ericparsley/UnwantedIcons
sudo mv /usr/share/applications/electron.desktop /home/ericparsley/UnwantedIcons
sudo mv /home/ericparsley/.local/share/applications/assistant.desktop /home/ericparsley/UnwantedIcons


#Yay setup
cd
mkdir Git
cd Git
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd

#Command for downloading and setting up Proton Updater
wget https://raw.githubusercontent.com/Termuellinator/ProtonUpdater/master/cproton.sh
chmod +x cproton.sh

#Command for programs I use from the AUR
yay -S optimus-manager-git optimus-manager-qt-git birdtray-git duckstation pcsx2-git retroarch-git retroarch-assets-git minecraft-launcher protontricks-git winetricks-git mellowplayer-git standardnotes-desktop teamviewer foxitreader bitwarden-bin github-desktop-bin visual-studio-code-bin

#Fully enable Teamviewer
sudo teamviewer daemon restart
sudo teamviewer daemon disable
sudo teamviewer daemon enable

#Widevine for MellowPlayer
curl -s "https://gitlab.com/ColinDuquesnoy/MellowPlayer/-/raw/master/scripts/install-widevine.sh" | bash

#Commands for cleaning left over files from main program install command and AUR install command.
sudo pacman -Rns $(pacman -Qtdq)
sudo pacman -Scc
yay -Scc

#Nvidia CUDA Detection
nvidia-modprobe

#Simply reboot computer
sudo reboot
