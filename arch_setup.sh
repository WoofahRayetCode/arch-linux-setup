#!/bin/bash
set -e

#Enable multilib and add chaotic aur
sudo chown -R -v ericparsley:ericparsley /etc/pacman.conf
sudo pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com
sudo pacman-key --lsign-key 3056513887B78AEB
sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst'
sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'
sudo pacman-key --init
sudo echo -e "\n" >> /etc/pacman.conf
sudo echo -e "\n[chaotic-aur]" >> /etc/pacman.conf
sudo echo -e "Include = /etc/pacman.d/chaotic-mirrorlist" >> /etc/pacman.conf

#Enable bluetooth
sudo systemctl start bluetooth.service
sudo systemctl enable bluetooth.service

#Enable parallel downloading
sudo sed -i 's/#ParallelDownloads/ParallelDownloads/g' /etc/pacman.conf

#Pacman output colorizating
sudo sed -i 's/#Color/Color/g' /etc/pacman.conf

#Change progressbar to pacman
sudo sed -i 's/VerbosePkgLists/VerbosePkgLists\nILoveCandy/g' /etc/pacman.conf

#Install regularly used apps
sudo pacman -Sy base-devel linux-headers jq partitionmanager nvidia-dkms nvidia-settings nvidia-utils lib32-nvidia-utils envycontrol switcheroo-control ntfs-3g jre-openjdk flatpak bash-language-server usbmuxd mame-tools lib32-mangohud mangohud goverlay vulkan-icd-loader lib32-vulkan-icd-loader lib32-vulkan-mesa-layers vulkan-mesa-layers winetricks protontricks bleachbit gamemode lib32-gamemode steam android-tools

#Needed for UUP Dump ISO creation
sudo pacman -S cabextract wimlib chntpw cdrtools aria2

#Needed to start switchroo service right away
sudo systemctl enable --now switcheroo-control

#Flatpak apps
flatpak install flathub com.github.wwmm.easyeffects

#Install yay
sudo pacman -Sy yay

#Emulators
sudo pacman -Syyu
yay -Sy duckstation-git pcsx-redux-git pcsx2-git play-emu rpcs3-git shadps4-git ppsspp-git vita3k-git

#install AUR apps that I use
sudo pacman -Sy
yay -Sy peazip msty-bin proton-ge-custom-bin umu-launcher sideloader-bin idevicerestore xpadneo-dkms ventoy-bin zenergy-git

#Full power for Nvidia GPUs - KEEP THIS!
sudo systemctl enable nvidia-powerd.service
sudo systemctl start nvidia-powerd.service

#Clean left over files
wget https://raw.githubusercontent.com/WoofahRayetCode/arch-linux-setup/refs/heads/master/clean_files.sh
chmod +x clean_files.sh
sudo ./clean_files.sh

#Hide icons for program I dont use
wget https://raw.githubusercontent.com/WoofahRayetCode/arch-linux-setup/refs/heads/master/hide_icons.sh
sudo chmod +x hide_icons.sh
sudo ./hide_icons.sh
