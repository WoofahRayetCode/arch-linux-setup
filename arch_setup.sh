#!/bin/bash
set -e

#Add stuff to environment variables
sudo chown -R -v ericparsley:ericparsley /etc/environment
sudo echo -e "MANGOHUD=1" >> /etc/environment
sudo echo -e PROTON_ENABLE_WAYLAND=1 
sudo echo -e PROTON_ENABLE_HDR=1 
sudo echo -e ENABLE_HDR_WSI=1

#set git config
git config --global user.name "Eric Parsley"
git config --global user.email "ericiparsley@hotmail.com"
git config --global core.editor "visual-studio-code-bin --wait"
git config --global pull.rebase true
git config --global init.defaultBranch master

#Add chaotic aur
sudo pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com
sudo pacman-key --lsign-key 3056513887B78AEB
sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst'
sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'
sudo pacman-key --init
sudo chown -R -v ericparsley:ericparsley /etc/pacman.conf
sudo echo -e "\n[chaotic-aur]" >> /etc/pacman.conf
sudo echo -e "Include = /etc/pacman.d/chaotic-mirrorlist" >> /etc/pacman.conf

#Install yay
sudo pacman -Sy yay

#Microsoft Emulator
yay -S xenia-canary-bin xemu-git

#Sony Playstation Emulators
sudo pacman -Syyu
yay -Sy duckstation-git pcsx2-git rpcs3-git shadps4-git ppsspp-git vita3k-git

#Nintendo Emulators
yay -S mesen2-git rmg mgba-qt-git melonds-git azahar-git dolphin-emu-git cemu-git citron-git

#install AUR apps that I use
sudo pacman -Sy
yay -Sy peazip chatterino2-nightly-bin binmerge sideloader-bin idevicerestore xpadneo-dkms ventoy-bin visual-studio-code-bin obs-studio-git obs-backgroundremoval davinci-resolve zenergy-dkms-git

#Install regularly used apps
sudo pacman -Sy base-devel linux-headers mkinitcpio-firmware filezilla handbrake jq partitionmanager ktimer qbittorrent ntfs-3g flatpak bash-language-server usbmuxd mame-tools wine-staging lib32-mangohud mangohud mangojuice lib32-mesa vulkan-radeon lib32-vulkan-radeon vulkan-icd-loader lib32-vulkan-icd-loader lib32-vulkan-mesa-layers vulkan-mesa-layers wine-staging winetricks protontricks bleachbit gamemode lib32-gamemode steam vesktop android-tools libreoffice-fresh

#Needed for UUP Dump ISO creation
sudo pacman -S cabextract wimlib chntpw cdrtools aria2

#Flatpak apps
flatpak install flathub com.github.wwmm.easyeffects
flatpak install flathub net.davidotek.pupgui2

#Clean leftover packages and hide extra icons
./clean-files.sh
./hide-icons.sh