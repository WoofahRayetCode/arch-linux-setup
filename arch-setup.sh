#!/bin/bash
set -e

#Make pacman.conf and fstab not be a pain in the ass
sudo chown -R ericparsley:ericparsley /etc/pacman.conf
sudo chown -R ericparsley:ericparsley /etc/fstab

#Remove some apps
sudo pacman -Rns htop kdeconnect ksysguard yakuake

#Install and set up Git
sudo pacman -Sy
sudo pacman -S git
git config --global user.email ericiparsley@hotmail.com
git config --global user.name WoofahRayetCode

#install parts for compiling aur stuff
sudo pacman -S base-devel linux-headers

#Set up drives
mkdir Games Storage WDMyCloudNAS
sudo echo "#Game SSD" >> /etc/fstab
sudo echo "UUID=d2efb19a-7727-48b2-8903-5e51d1ec56dc /home/ericparsley/Games btrfs defaults 0 0" >> /etc/fstab
sudo echo "#Storage HDD" >> /etc/fstab
sudo echo "UUID=d87f8ddb-8609-4bf3-8e16-cfb878285d14 /home/ericparsley/Storage btrfs defaults 0 0" >> /etc/fstab
sudo echo "#Network Share Mount" >> /etc/fstab
sudo echo "//192.168.0.183/Public /home/ericparsley/WDMyCloudNAS cifs rw,auto,nofail,file_mode=0777,dir_mode=0777,umask=0 0 0" >> /etc/fstab
sudo mount.cifs //192.168.0.183/Public /home/ericparsley/WDMyCloudNAS -o username=ericparsley,uid=1000,gid=1000,vers=2.0
sudo systemctl daemon-reload
sudo mount -a
sudo chown -R -v ericparsley:ericparsley /home/ericparsley/Games
sudo chown -R -v ericparsley:ericparsley /home/ericparsley/Storage
sudo chown -R -v ericparsley:ericparsley /home/ericparsley/WDMyCloudNAS

#Download file for easily fixing database lock issue
wget https://raw.githubusercontent.com/WoofahRayetCode/arch-linux-stuff/master/database-unlock.sh
chmod +x database-unlock.sh

#File to regularly run to clean left over files
wget https://raw.githubusercontent.com/WoofahRayetCode/arch-linux-stuff/master/clean-files.sh
chmod +x clean-files.sh

#Remove icons I don't want on the programs menu
wget https://raw.githubusercontent.com/WoofahRayetCode/arch-linux-stuff/master/hide-icons.sh
chmod +x hide-icons.sh

#Download script for autostarting noisetorch
wget https://raw.githubusercontent.com/WoofahRayetCode/arch-linux-stuff/master/noisetorch_autostart.sh
chmod +x noisetorch_autostart.sh

#Download onedrive sunc file
wget https://raw.githubusercontent.com/WoofahRayetCode/arch-linux-stuff/master/onedrive_sync.sh
chmod +x onedrive_sync.sh

wget https://raw.githubusercontent.com/WoofahRayetCode/arch-linux-stuff/master/check_space.sh
chmod +x check_space.sh

wget https://raw.githubusercontent.com/WoofahRayetCode/arch-linux-stuff/master/nas_mount.sh
chmod +x nas_mount.sh

wget https://raw.githubusercontent.com/WoofahRayetCode/arch-linux-stuff/master/expect_nas_mount.exp
chmod +x expect_nas_mount.exp

#Enable parallel downloading
sudo sed -i 's/#ParallelDownloads/ParallelDownloads/g' /etc/pacman.conf

#Pacman output colorizating
sudo sed -i 's/#Color/Color/g' /etc/pacman.conf

#Change progressbar to pacman
sudo sed -i 's/VerbosePkgLists/VerbosePkgLists\nILoveCandy/g' /etc/pacman.conf

#Install regularly used apps
sudo pacman -Sy
sudo pacman -S flatpak expect yay partitionmanager v4l2loopback-dkms wine-staging btop winetricks lutris bleachbit steam discord element-desktop telegram-desktop caprine signal-desktop krita libreoffice-fresh kdenlive obs-studio android-tools

#Flatpak app I use
flatpak install bottles

#Enable Chaotic AUR
sudo pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com
sudo pacman-key --lsign-key 3056513887B78AEB
sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst' 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'
sudo echo "[chaotic-aur]" >> /etc/pacman.conf
sudo echo "Include = /etc/pacman.d/chaotic-mirrorlist" >> /etc/pacman.conf
sudo pacman -Sy

#Emulators
sudo pacman -Sy
yay -S duckstation-git pcsx2-git rpcs3-git ppsspp-git vita3k-git mgba-qt-git libmgba-git melonds-git citra-qt-git dolphin-emu-git cemu-git ryujinx-git yuzu-early-access retroarch-git

#install AUR apps that I use
sudo pacman -Sy
yay -S mullvad-vpn jdownloader2 gcdemu onedrive-abraunegg protonup-qt antimicrox minecraft-launcher xpadneo-dkms-git rustdesk-git twitter protonup-qt ventoy-bin balena-etcher noisetorch-git streamdeck-ui android-messages-desktop-bin youtube-music-bin timeshift heroic-games-launcher microsoft-edge-stable-bin visual-studio-code-bin

#Clean left over files from AUR stuff
./clean-files.sh

#Hide icons in programs menu that I don't want to see
./hide-icons.sh

#Setup OneDrive
onedrive
./onedrive_sync.sh
