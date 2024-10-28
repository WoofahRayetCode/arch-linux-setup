#!/bin/bash
set -e

#Change makeflag so aur programs compiles faster
sudo micro /etc/makepkg.conf

#Enable multilib and add chaotic aur
sudo micro /etc/pacman.conf

[chaotic-aur]
Include = /etc/pacman.d/chaotic-mirrorlist

sudo pacman-key --init

sudo pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com
sudo pacman-key --lsign-key 3056513887B78AEB
sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst'
sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'

sudo pacman -Sy

#Enable bluetooth
sudo systemctl start bluetooth.service
sudo systemctl enable bluetooth.service

#Set up Git
git config --global user.name WoofahRayetCode
git config --global user.email 56867834+WoofahRayetCode@users.noreply.github.com

#Download file for easily fixing database lock issue
wget https://raw.githubusercontent.com/WoofahRayetCode/arch-linux-stuff/master/database-unlock.sh
chmod +x database-unlock.sh

#File to regularly run to clean left over files
wget https://raw.githubusercontent.com/WoofahRayetCode/arch-linux-stuff/master/clean-files.sh
chmod +x clean-files.sh

#Remove icons I don't want on the programs menu
wget https://raw.githubusercontent.com/WoofahRayetCode/arch-linux-stuff/master/hide-icons.sh
chmod +x hide-icons.sh

#Check whats using space
wget https://raw.githubusercontent.com/WoofahRayetCode/arch-linux-stuff/master/check_space.sh
chmod +x check_space.sh

#Autostart file for Noisetorch
wget https://raw.githubusercontent.com/WoofahRayetCode/arch-linux-setup/master/noisetorch_autostart.sh
chmod +x noisetorch_autostart.sh

#Enable parallel downloading
sudo sed -i 's/#ParallelDownloads/ParallelDownloads/g' /etc/pacman.conf

#Pacman output colorizating
sudo sed -i 's/#Color/Color/g' /etc/pacman.conf

#Change progressbar to pacman
sudo sed -i 's/VerbosePkgLists/VerbosePkgLists\nILoveCandy/g' /etc/pacman.conf

#Install regularly used apps
sudo pacman -Sy
sudo pacman -S base-devel linux611-headers qt6-wayland  glances envycontrol krename ntfs-3g jre-openjdk flatpak ladspa noise-suppression-for-voice bash-language-server usbmuxd openh264 movit mame-tools lib32-mangohud mangohud goverlay wine-staging vulkan-icd-loader lib32-vulkan-icd-loader lib32-vulkan-mesa-layers vulkan-mesa-layers winetricks bleachbit gamemode lib32-gamemode steam-native-runtime discord android-tools

#Flatpak apps
flatpak install flathub com.github.wwmm.easyeffects
flatpak install flathub chat.simplex.simplex
flatpak install flathub org.strawberrymusicplayer.strawberry
flatpak install flathub org.gnome.baobab
flatpak install flathub org.kde.kdenlive
flatpak install flathub me.proton.Pass
flatpak install flathub com.rustdesk.RustDesk
flatpak install flathub org.standardnotes.standardnotes
flatpak install flathub net.davidotek.pupgui2
flatpak install flathub com.github.Matoking.protontricks
flatpak install flathub org.telegram.desktop
flatpak install flathub org.kde.krita
flatpak install flathub org.libreoffice.LibreOffice
flatpak install flathub org.musicbrainz.Picard

#Install yay
sudo pacman -S yay

#Emulators
sudo pacman -Syyu
yay -S duckstation-git pcsx2-git rpcs3-git ppsspp-git vita3k-git

#install AUR apps that I use
sudo pacman -Sy
yay -S obs-studio-tytan652 msty-bin idevicerestore biglybt gcdemu xpadneo-dkms ventoy-bin youtube-music-bin

#Important Drivers?
yay -S mkinitcpio-firmware 

#Fix for audio on 9i Laptop - Perfect this fix for foreseeable future
sudo pacman -S jq i2c-tools
curl -s https://raw.githubusercontent.com/DanielWeiner/tas2781-fix-16IRX8H/refs/heads/main/install.sh | bash -s --

#Make 4090 work at full power on laptop - KEEP THIS!
sudo systemctl enable nvidia-powerd.service
sudo systemctl start nvidia-powerd.service

#Clean left over files from AUR stuff
./clean-files.sh

#Hide icons in programs menu that I don't want to see
./hide-icons.sh
