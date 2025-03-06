#!/bin/bash
set -e

#Enable multilib and add chaotic aur
sudo chown -R -v ericparsley:ericparsley /etc/pacman.conf
sudo pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com
sudo pacman-key --lsign-key 3056513887B78AEB
sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst'
sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'
sudo pacman-key --init
sudo echo -e "\n[chaotic-aur]" >> /etc/pacman.conf
sudo echo -e "Include = /etc/pacman.d/chaotic-mirrorlist" >> /etc/pacman.conf

#Enable parallel downloading
sudo sed -i 's/#ParallelDownloads/ParallelDownloads/g' /etc/pacman.conf

#Pacman output colorizating
sudo sed -i 's/#Color/Color/g' /etc/pacman.conf

#Change progressbar to pacman
sudo sed -i 's/VerbosePkgLists/VerbosePkgLists\nILoveCandy/g' /etc/pacman.conf

#Install regularly used apps
sudo pacman -Sy base-devel linux-headers jq partitionmanager ntfs-3g jre-openjdk flatpak bash-language-server usbmuxd mame-tools wine-staging lib32-mangohud mangohud goverlay vulkan-icd-loader lib32-vulkan-icd-loader lib32-vulkan-mesa-layers vulkan-mesa-layers winetricks protontricks bleachbit gamemode lib32-gamemode steam android-tools libreoffice-fresh

#Needed for UUP Dump ISO creation
sudo pacman -S cabextract wimlib chntpw cdrtools aria2

#Flatpak apps
flatpak install flathub com.github.wwmm.easyeffects

#Install yay
sudo pacman -Sy yay

#Emulators
sudo pacman -Syyu
yay -Sy duckstation-git pcsx2-git rpcs3-git shadps4-git ppsspp-git vita3k-git

#install AUR apps that I use
sudo pacman -Sy
yay -Sy peazip msty-bin sideloader-bin idevicerestore xpadneo-dkms ventoy-bin visual-studio-code-bin standardnotes-bin
