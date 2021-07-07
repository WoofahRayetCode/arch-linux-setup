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

#Set branch to Unstable
sudo pacman-mirrors --api --set-branch unstable
sudo pacman-mirrors --fasttrack 5 && sudo pacman -Syyu
sudo pacman -Sy
sudo pacman -Syu

#Programs to remove
sudo pacman -Rns vim kcalc kwalletmanager okular korganizer clementine k3b kdenlive falkon kdeconnect transmission-qt gwenview kolourpaint

#Main programs I use
sudo pacman -S base-devel git qbittorrent electron yay qt gamemode lib32-gamemode steam wine-staging winetricks lutris discord caprine krita libreoffice-fresh vlc bleachbit

#Install yay
cd
mkdir Git
cd Git
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd

#AUR Programs I use
yay -S duckstation-git pcsx2-git rpcs3-git ppsspp-git mgba-qt-git desmume-git citra-qt-git rclone-bin expressvpn protontricks minecraft-launcher steamcmd obs-studio-git davinci-resolve signal-desktop-beta-bin bitwarden-bin visual-studio-code-bin github-desktop-bin standardnotes-bin

#Start ExpressVPN
systemctl start expressvpn.service

#Remove icons cuz OCD :(
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
sudo rm -f stoken-gui-small.desktop
sudo rm -f stoken-gui.desktop
sudo rm -f org.kde.cuttlefish.desktop
sudo rm -f org.kde.plasmaengineexplorer-desktop
sudo rm -f org.kde.plasma.lookandfeelexplorer.desktop
sudo rm -f org.kde.plasma.themeexplorer.desktop
cd

#To make sure program can use the Nvidia GPU
nvidia-modprobe

#Clean shit
sudo pacman -Rns $(pacman -Qtdq)
sudo pacman -Scc
yay -Scc
rm -rf ~/.cache/*
