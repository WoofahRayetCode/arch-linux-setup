#!/bin/bash
set -e

#Change makeflag so aur programs compiles faster
sudo nano /etc/makepkg.conf

#Enable multilib
sudo nano /etc/pacman.conf

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

#File for updating system TTL for tethering
wget https://raw.githubusercontent.com/WoofahRayetCode/arch-linux-setup/master/ttl-255-sysctl.conf
sudo mv ttl-255-sysctl.conf /etc/sysctl.d/

wget https://raw.githubusercontent.com/WoofahRayetCode/arch-linux-setup/master/TIAS2781RCA2.bin
sudo cp TIAS2781RCA2.bin /lib/firmware/

#Enable parallel downloading
sudo sed -i 's/#ParallelDownloads/ParallelDownloads/g' /etc/pacman.conf

#Pacman output colorizating
sudo sed -i 's/#Color/Color/g' /etc/pacman.conf

#Change progressbar to pacman
sudo sed -i 's/VerbosePkgLists/VerbosePkgLists\nILoveCandy/g' /etc/pacman.conf

#Install regularly used apps
sudo pacman -Sy
sudo pacman -S base-devel nvidia-dkms lib32-nvidia-utils nvidia-utils nvidia-settings ladspa noise-suppression-for-voice alacritty freedownloadmanager neofetch bash-language-server usbmuxd openh264 movit kdenlive partitionmanager mame-tools lutris qbittorrent lib32-mangohud mangohud goverlay wine-staging vulkan-icd-loader lib32-vulkan-icd-loader lib32-vulkan-mesa-layers vulkan-mesa-layers winetricks bleachbit gamemode steam protontricks discord telegram-desktop krita libreoffice-fresh obs-studio android-tools

#Enable Chaotic AUR
sudo chown -R -v ericparsley:ericparsley /etc/pacman.conf
sudo pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com
sudo pacman-key --lsign-key 3056513887B78AEB
sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst' 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'
sudo echo -e "\n[chaotic-aur]" >> /etc/pacman.conf
sudo echo -e "Include = /etc/pacman.d/chaotic-mirrorlist" >> /etc/pacman.conf

#Emulators
sudo pacman -Syyu
yay -S duckstation-avx-git pcsx2-avx-git rpcs3-git ppsspp-avx-git vita3k-avx-git flycast-avx-git mesen2-git rmg-git mgba-qt-git libmgba-git melonds-git lime3ds-git dolphin-emu-avx-git cemu-git ryujinx-git retroarch-git

#install AUR apps that I use
sudo pacman -Sy
yay -S envycontrol webapp-manager tenacity-git baca-ereader-git coolercontrol betterdiscord-installer mediawriter chatall-bin mullvad-vpn standardnotes-bin stream-overlay obs-backgroundremoval gcdemu xpadneo-dkms minecraft-launcher ventoy-bin protonup-qt youtube-music-bin visual-studio-code-bin timeshift noisetorch-git

#Clean left over files from AUR stuff
./clean-files.sh

#Hide icons in programs menu that I don't want to see
./hide-icons.sh
