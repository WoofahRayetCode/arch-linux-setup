#!/bin/bash
set -e

#Change makeflag so aur stuff compiles faster
sudo nano /etc/makepkg.conf

#Enable multilib
sudo nano /etc/pacman.conf

#Install YAY
sudo pacman -S base-devel linux-headers
sudo pacman -Syu
sudo pacman -S git
mkdir Git
cd Git
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd

#Enable bluetooth
sudo systemctl start bluetooth.service
sudo systemctl enable bluetooth.service

#Set up Git
git config --global user.email ericiparsley@hotmail.com
git config --global user.name WoofahRayetCode

#Download file for easily fixing database lock issue
#wget https://raw.githubusercontent.com/WoofahRayetCode/arch-linux-stuff/master/database-unlock.sh
#chmod +x database-unlock.sh

#File to regularly run to clean left over files
wget https://raw.githubusercontent.com/WoofahRayetCode/arch-linux-stuff/master/clean-files.sh
chmod +x clean-files.sh

#Remove icons I don't want on the programs menu
wget https://raw.githubusercontent.com/WoofahRayetCode/arch-linux-stuff/master/hide-icons.sh
chmod +x hide-icons.sh

#Check whats using space
wget https://raw.githubusercontent.com/WoofahRayetCode/arch-linux-stuff/master/check_space.sh
chmod +x check_space.sh

#Enable parallel downloading
sudo sed -i 's/#ParallelDownloads/ParallelDownloads/g' /etc/pacman.conf

#Pacman output colorizating
sudo sed -i 's/#Color/Color/g' /etc/pacman.conf

#Change progressbar to pacman
sudo sed -i 's/VerbosePkgLists/VerbosePkgLists\nILoveCandy/g' /etc/pacman.conf

#Install regularly used apps
sudo pacman -Sy
sudo pacman -S nvidia-settings movit kdenlive kalarm partitionmanager easyeffects mame-tools lutris qbittorrent lib32-mangohud mangohud goverlay wine-staging winetricks bleachbit steam telegram-desktop caprine krita libreoffice-fresh obs-studio android-tools

#Enable Chaotic AUR
sudo chown -R -v ericparsley:ericparsley /etc/pacman.conf
sudo pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com
sudo pacman-key --lsign-key 3056513887B78AEB
sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst' 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'
sudo echo -e "\n[chaotic-aur]" >> /etc/pacman.conf
sudo echo -e "Include = /etc/pacman.d/chaotic-mirrorlist" >> /etc/pacman.conf

#Emulators
sudo pacman -Syyu
yay -S duckstation-git pcsx2-git rpcs3-git ppsspp-git vita3k-git mesen2-git rmg-git mgba-qt-git libmgba-git melonds-git citra-qt-git dolphin-emu-git cemu-git ryujinx-git yuzu-early-access retroarch-git

#install AUR apps that I use
sudo pacman -Sy
yay -S envycontrol tlpui-git mullvad-vpn standardnotes-bin google-chrome vesktop freedownloadmanager gcdemu minecraft-launcher ventoy-bin protonup-qt youtube-music-bin visual-studio-code-bin timeshift

#Clean left over files from AUR stuff
./clean-files.sh

#Hide icons in programs menu that I don't want to see
./hide-icons.sh
