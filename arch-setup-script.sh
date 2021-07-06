#!/bin/bash
set -e

#Completely shit on the cpu
wget https://raw.githubusercontent.com/WoofahRayetCode/arch-linux-stuff/master/all-cpu-cores-compiling.sh
chmod +x all-cpu-cores-compiling.sh
./all-cpu-cores-compiling.sh

#Command for downloading and setting up Proton Updater for steam
wget https://raw.githubusercontent.com/Termuellinator/ProtonUpdater/master/cproton.sh
chmod +x cproton.sh

#File to regularly run to clean left over files
wget https://raw.githubusercontent.com/WoofahRayetCode/arch-linux-stuff/master/clean-files.sh
chmod +x clean-files.sh

#Change to unstable branch
sudo pacman-mirrors --api --set-branch unstable

#Programs to remove
sudo pacman -Rns gwenview htop kclac kdeconnect konversation okular stoken yakuake

#Main programs I use
sudo pacman -S base-devel plasma-nm networkmanager-openvpn networkmanager nm-connection-editor network-manager-applet qbittorrent plasma-systemmonitor kio-gdrive electron alacritty yay qt gamemode lib32-gamemode steam wine-staging winetricks lutris discord caprine krita libreoffice-fresh vlc bleachbit

#Enable networking service
sudo systemctl enable NetworkManager.service
sudo systemctl start NetworkManager.service

#So gpg key stuff works
echo "keyserver keyserver.ubuntu.com" > /home/$USER/.gnupg/gpg.conf

#AUR Programs I use
yay -S duckstation-git pcsx2-git rpcs3-git ppsspp-git mgba-qt-git desmume-git citra-qt-git ryujinx-ldn-bin expressvpn protontricks minecraft-launcher steamcmd obs-studio-bit davinci-resolve signal-desktop-beta-bin bitwarden-bin vscodium-bin vscodium-bin-marketplace github-desktop-bin standardnotes-bin

#Start ExpressVPN
systemctl start expressvpn.service

#Remove icons cuz OCD :s
cd /usr/share/applications
sudo rm -f avahi-discover.desktop
sudo rm -f bssh.desktop
sudo rm -f bvnc.desktop
sudo rm -f assistant.desktop
sudo rm -f designer.desktop
sudo rm -f linguist.desktop
sudo rm -f qdbusviewer.desktop
sudo rm -f uxterm.desktop
sudo rm -f xterm.desktop
sudo rm -f UserFeedbackConsole.desktop
sudo rm -f org.kde.plasma.emojier.desktop
sudo rm -f lstopo.desktop
sudo rm -f qv4l2.desktop
sudo rm -f qvidcap.desktop
sudo rm -f electron.desktop
cd

#To make sure program can use the Nvidia GPU
nvidia-modprobe

#Clean shit
sudo pacman -Rns $(pacman -Qtdq)
sudo pacman -Scc
yay -Scc
rm -rf ~/.cache/*
