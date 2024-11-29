#!/bin/bash
set -e

#Enable multilib and add chaotic aur
sudo chown -R -v ericiparsley:ericiparsley /etc/pacman.conf
sudo pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com
sudo pacman-key --lsign-key 3056513887B78AEB
sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst'
sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'
sudo pacman-key --init
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
sudo pacman -Sy base-devel linux-headers jq partitionmanager nvidia-dkms nvidia-settings nvidia-utils lib32-nvidia-utils ntfs-3g jre-openjdk flatpak bash-language-server usbmuxd mame-tools lib32-mangohud mangohud goverlay vulkan-icd-loader lib32-vulkan-icd-loader lib32-vulkan-mesa-layers vulkan-mesa-layers winetricks protontricks bleachbit gamemode lib32-gamemode steam android-tools

#Needed for UUP Dump ISO creation
sudo pacman -S cabextract wimlib chntpw cdrtools aria2

#Needed to start switchroo service right away
sudo systemctl enable --now switcheroo-control

#Flatpak apps
flatpak install flathub de.z_ray.OptimusUI
flatpak install flathub com.github.wwmm.easyeffects
flatpak install flathub org.strawberrymusicplayer.strawberry
flatpak install flathub org.kde.kdenlive
flatpak install flathub me.proton.Pass
flatpak install flathub com.rustdesk.RustDesk
flatpak install flathub org.standardnotes.standardnotes
flatpak install flathub com.github.Matoking.protontricks
flatpak install flathub org.kde.krita
flatpak install flathub org.libreoffice.LibreOffice
flatpak install flathub io.github.elevenhsoft.WebApps
flatpak install flathub com.discordapp.Discord
flatpak install flathub org.kde.krename
flatpak install flathub com.vscodium.codium

#Run to get better discord set up
curl -O https://raw.githubusercontent.com/bb010g/betterdiscordctl/master/betterdiscordctl
chmod +x betterdiscordctl
sudo mv betterdiscordctl /usr/local/bin

#Install yay
sudo pacman -Sy yay

#Emulators
sudo pacman -Syyu
yay -Sy duckstation-git pcsx2-git rpcs3-git ppsspp-git vita3k-git

#install AUR apps that I use
sudo pacman -Sy
yay -Sy zenergy-dkms-git onedrive-abraunegg-git peazip gnome-keyring msty-bin proton-ge-custom-bin umu-launcher sideloader-bin bluemail idevicerestore gcdemu xpadneo-dkms ventoy-bin youtube-music-bin

#Fix for audio on 9i Laptop - Perfer this fix for foreseeable future
curl -s https://raw.githubusercontent.com/DanielWeiner/tas2781-fix-16IRX8H/refs/heads/main/install.sh | bash -s --

#Make 4090 work at full power on 9i laptop - KEEP THIS!
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

#set up OneDrive
wget https://raw.githubusercontent.com/WoofahRayetCode/arch-linux-setup/refs/heads/master/onedrive_sync_setup.sh
sudo chmod +x onedrive_sync_setup.sh
./onedrive_sync_setup.sh

#Run to sync OneDrive after initial setup
wget https://raw.githubusercontent.com/WoofahRayetCode/arch-linux-setup/refs/heads/master/onedrive_sync.sh
sudo chmod +x onedrive_sync.sh
./onedrive_sync.sh

#Needed for AMD desktop. KEEP THIS!
wget https://raw.githubusercontent.com/WoofahRayetCode/arch-linux-setup/refs/heads/master/zenergy.sh
chmod +x zenergy.sh
./zenergy.sh

#Need to run this file at every login so Mangohud can read wattage for Intel CPU
wget https://raw.githubusercontent.com/WoofahRayetCode/arch-linux-setup/refs/heads/master/goverlay_intel_power_reading.sh
sudo chmod +x goverlay_intel_power_reading.sh
