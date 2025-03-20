#!/bin/bash
set -e

#Alias for pacman
sudo echo -e "export PASSWORD=StlkrWlf1990" >> ~/.bashrc
sudo echo -e "alias pacman=sudo pacman" >> ~/.bashrc
sudo echo -e "alias update=yay" >> ~/.bashrc
sudo echo -e "alias bashup=source ~/.bashrc" >> ~/.bashrc

#Add stuff to environment variables
sudo echo -e "MANGOHUD=1" >> /etc/environment
sudo echo -e "DXVK_HDR=1" >> /etc/environment
sudo echo -e "ENABLE_HDR_WSI=1" >> /etc/environment
sudo echo -e "KWIN_DRM_ALLOW_NVIDIA_COLORSPACE=1" >> /etc/environment
sudo echo -e "VKD3D_CONFIG=dxr11,dxr" >> /etc/environment
sudo echo -e "PROTON_ENABLE_NVAPI=1" >> /etc/environment
sudo echo -e "PROTON_ENABLE_NGX_UPDATER=1" >> /etc/environment


#set git config
git config --global user.name "Eric Parsley"
git config --global user.email "ericiparsley@hotmail.com"
git config --global core.editor "visual-studio-code --wait"
git config --global pull.rebase true
git config --global init.defaultBranch master 

#Add chaotic aur
sudo pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com
sudo pacman-key --lsign-key 3056513887B78AEB
sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst'
sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'
sudo pacman-key --init
sudo echo -e "\n[chaotic-aur]" >> /etc/pacman.conf
sudo echo -e "Include = /etc/pacman.d/chaotic-mirrorlist" >> /etc/pacman.conf

#Asus Repo
sudo pacman-key --recv-keys 8F654886F17D497FEFE3DB448B15A6B0E9A3FA35
sudo pacman-key --finger 8F654886F17D497FEFE3DB448B15A6B0E9A3FA35
sudo pacman-key --lsign-key 8F654886F17D497FEFE3DB448B15A6B0E9A3FA35
sudo pacman-key --finger 8F654886F17D497FEFE3DB448B15A6B0E9A3FA35
sudo echo -e "\n[g14]" >> /etc/pacman.conf
sudo echo -e "Server = https://arch.asus-linux.org" >> /etc/pacman.conf

#Refresh
sudo pacman -Sy

#Add key
wget "https://keyserver.ubuntu.com/pks/lookup?op=get&search=0x8b15a6b0e9a3fa35" -O g14.sec
sudo pacman-key -a g14.sec

#Enable parallel downloading
sudo sed -i 's/#ParallelDownloads/ParallelDownloads/g' /etc/pacman.conf

#Pacman output colorizating
sudo sed -i 's/#Color/Color/g' /etc/pacman.conf

#Change progressbar to pacman
sudo sed -i 's/VerbosePkgLists/VerbosePkgLists\nILoveCandy/g' /etc/pacman.conf

#Asus programs
sudo pacman -S asusctl power-profiles-daemon
sudo pacman -S supergfxctl switcheroo-control
sudo pacman -S rog-control-center
systemctl enable --now power-profiles-daemon.service
systemctl enable --now supergfxd
systemctl enable --now switcheroo-control

#Install regularly used apps
sudo pacman -Sy base-devel linux-headers mkinitcpio-firmware handbrake dragon jq partitionmanager qbittorrent ntfs-3g jre-openjdk flatpak bash-language-server usbmuxd mame-tools wine-staging lib32-mangohud mangohud goverlay vulkan-icd-loader lib32-vulkan-icd-loader lib32-vulkan-mesa-layers vulkan-mesa-layers wine-staging winetricks protontricks bleachbit gamemode lib32-gamemode steam discord android-tools libreoffice-fresh

#Needed for UUP Dump ISO creation
sudo pacman -S cabextract wimlib chntpw cdrtools aria2

#Flatpak apps
flatpak install flathub com.github.wwmm.easyeffects
flatpak install flathub net.davidotek.pupgui2

#Install yay
sudo pacman -Sy yay

#Emulators
sudo pacman -Syyu
yay -Sy duckstation-git pcsx2-git rpcs3-git shadps4-git ppsspp-git vita3k-git

#install AUR apps that I use
sudo pacman -Sy
yay -Sy peazip sideloader-bin idevicerestore xpadneo-dkms ventoy-bin visual-studio-code-bin github-desktop-bin dotnet-sdk-bin betterbird-bin librewolf-bin standardnotes-bin obs-studio-git obs-backgroundremoval davinci-resolve freedownloadmanager zenergy-dkms-git