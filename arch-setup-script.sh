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

#Remove icons I don't want on the programs menu
wget https://raw.githubusercontent.com/WoofahRayetCode/arch-linux-stuff/master/hide-icons.sh
chmod +x hide-icons.sh

#Update mirrors and checks for updates every time I log in
alias update="sudo pacman-mirrors -f 5 && sudo pacman -Syyu"

#Main programs I use
sudo pacman -S base-devel git alacritty yay qbittorrent electron qt gamemode lib32-gamemode steam wine-staging winetricks lutris discord signal-desktop caprine krita libreoffice-fresh vlc bleachbit guvcview

#Install yay
cd
mkdir Git
cd Git
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd

#AUR Programs I use
yay -S duckstation-git pcsx2-git rpcs3-git ppsspp-git mgba-qt-git desmume-git citra-qt-git protontricks minecraft-launcher steamcmd obs-studio-git davinci-resolve bitwarden-bin unity-hub visual-studio-code-bin github-desktop-bin standardnotes-bin noisetorch

#To make sure program can use the Nvidia GPU
nvidia-modprobe

#Clean shit
./clean-files.sh

#Hide icons
./hide-icons.sh
