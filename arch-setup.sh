#!/bin/bash
set -e

#Change makeflag so aur stuff compiles faster
sudo nano /etc/makepkg.conf

#Enable bluetooth
sudo systemctl start bluetooth.service
sudo systemctl enable bluetooth.service

#Key stuff for G14 repo
sudo pacman-key --recv-keys 8F654886F17D497FEFE3DB448B15A6B0E9A3FA35
sudo pacman-key --finger 8F654886F17D497FEFE3DB448B15A6B0E9A3FA35
sudo pacman-key --lsign-key 8F654886F17D497FEFE3DB448B15A6B0E9A3FA35
sudo pacman-key --finger 8F654886F17D497FEFE3DB448B15A6B0E9A3FA35

#Set up Git
git config --global user.email ericiparsley@hotmail.com
git config --global user.name WoofahRayetCode

#Download file for easily fixing database lock issue
wget https://raw.githubusercontent.com/WoofahRayetCode/arch-linux-stuff/master/database-unlock.sh
chmod +x database-unlock.sh

#File to regularly run to clean left over files
wget https://raw.githubusercontent.com/WoofahRayetCode/arch-linux-stuff/master/clean-files.sh
chmod +x clean-files.sh

#Remove icons I don't want on the programs menu
wget https://raw.githubusercontent.com/WoofahRayetCode/arch-linux-stuff/master/hide-icons.sh
chmod +x hide-icons.sh

wget https://raw.githubusercontent.com/WoofahRayetCode/arch-linux-stuff/master/check_space.sh
chmod +x check_space.sh

#Enable parallel downloading
sudo sed -i 's/#ParallelDownloads/ParallelDownloads/g' /etc/pacman.conf

#Pacman output colorizating
sudo sed -i 's/#Color/Color/g' /etc/pacman.conf

#Change progressbar to pacman
sudo sed -i 's/VerbosePkgLists/VerbosePkgLists\nILoveCandy/g' /etc/pacman.conf

#Remove some stuff
sudo pacman -Rns htop vim

#Install regularly used apps
sudo pacman -Sy
sudo pacman -S base-devel linux-headers kwalletmanager kwallet-pam mame-tools lutris partitionmanager v4l2loopback-dkms qbittorrent wine-staging btop winetricks lutris bleachbit steam discord telegram-desktop caprine krita libreoffice-fresh obs-studio android-tools

#Enable Chaotic AUR
sudo chown -R -v ericparsley:ericparsley /etc/pacman.conf
sudo pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com
sudo pacman-key --lsign-key 3056513887B78AEB
sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst' 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'
sudo echo -e "\n[chaotic-aur]" >> /etc/pacman.conf
sudo echo "Include = /etc/pacman.d/chaotic-mirrorlist" >> /etc/pacman.conf

#Enable G14 Repo
sudo echo -e "\n[g14]" >> /etc/pacman.conf
sudo echo -e "Server = https://arch.asus-linux.org" >> /etc/pacman.conf

#Update all the shits
sudo pacman -Suy

#Install important Asus G14 stuff
sudo pacman -S asusctl
sudo pacman -S supergfxctl
sudo pacman -S rog-control-center
sudo pacman -Sy linux-g14 linux-g14-headers
sudo systemctl enable --now power-profiles-daemon.service
sudo systemctl enable --now supergfxd

#Emulators
sudo pacman -Syyu
yay -S duckstation-git pcsx2-git rpcs3-git ppsspp-git vita3k-git mgba-qt-git libmgba-git melonds-git citra-qt-git dolphin-emu-git cemu-git ryujinx-git yuzu-early-access retroarch-git

#install AUR apps that I use
sudo pacman -Sy
yay -S mullvad-vpn freedownloadmanager signal-desktop-beta gcdemu minecraft-launcher ventoy-bin protonup-qt android-messages-desktop-bin youtube-music-bin timeshift visual-studio-code-bin

#Clean left over files from AUR stuff
./clean-files.sh

#Hide icons in programs menu that I don't want to see
./hide-icons.sh
