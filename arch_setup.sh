#!/bin/bash
set -e

#Add stuff to environment variables
sudo chown -R -v ericparsley:ericparsley /etc/environment
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

#Asus Repo
#sudo pacman-key --recv-keys 8F654886F17D497FEFE3DB448B15A6B0E9A3FA35
#sudo pacman-key --finger 8F654886F17D497FEFE3DB448B15A6B0E9A3FA35
#sudo pacman-key --lsign-key 8F654886F17D497FEFE3DB448B15A6B0E9A3FA35
#sudo pacman-key --finger 8F654886F17D497FEFE3DB448B15A6B0E9A3FA35
#sudo echo -e "\n[g14]" >> /etc/pacman.conf
#sudo echo -e "Server = https://arch.asus-linux.org" >> /etc/pacman.conf

#Refresh
sudo pacman -Sy

#Add G14 Repo key
#wget "https://keyserver.ubuntu.com/pks/lookup?op=get&search=0x8b15a6b0e9a3fa35" -O g14.sec
#sudo pacman-key -a g14.sec

#Enable parallel downloading, output colorizating, change progressbar to pacman
sudo sed -i 's/#ParallelDownloads/ParallelDownloads/g' /etc/pacman.conf
sudo sed -i 's/#Color/Color/g' /etc/pacman.conf
sudo sed -i 's/VerbosePkgLists/VerbosePkgLists\nILoveCandy/g' /etc/pacman.conf

#Install yay
sudo pacman -Sy yay

#AMD Proprietary OpenGL drivers
yay -S amdgpu-pro-ogpl lib32-amdgpu-pro-ogpl vulkan-amdgpu-pro-ogpl lib32-vulkan-amdgpu-pro-ogpl amf-amdgpu-pro

#Sony Playstation Emulators
sudo pacman -Syyu
yay -Sy duckstation-git pcsx2-git rpcs3-git shadps4-git ppsspp-git vita3k-git

#Nintendo Emulators
yay -S mesen2-git rmg-git mgba-qt-git melonds-git azahar-git dolphin-emu-git cemu-git citron-git

#install AUR apps that I use
sudo pacman -Sy
yay -Sy peazip chatterino2-git binmerge sideloader-bin idevicerestore xpadneo-dkms ventoy-bin visual-studio-code-bin dotnet-sdk-bin microsoft-edge-dev-bin standardnotes-bin obs-studio-git obs-backgroundremoval davinci-resolve zenergy-dkms-git

#Asus programs
#sudo pacman -S asusctl power-profiles-daemon
#sudo pacman -S supergfxctl switcheroo-control
#sudo pacman -S rog-control-center
#systemctl enable --now power-profiles-daemon.service
#systemctl enable --now supergfxd
#systemctl enable --now switcheroo-control

#Install regularly used apps
sudo pacman -Sy base-devel linux-headers mkinitcpio-firmware jdownloader2 filezilla handbrake dragon jq partitionmanager ktimer qbittorrent ntfs-3g flatpak bash-language-server usbmuxd mame-tools wine-staging lib32-mangohud mangohud goverlay lib32-mesa vulkan-radeon lib32-vulkan-radeon vulkan-icd-loader lib32-vulkan-icd-loader lib32-vulkan-mesa-layers vulkan-mesa-layers wine-staging winetricks protontricks bleachbit gamemode lib32-gamemode steam vesktop android-tools libreoffice-fresh

#Needed for UUP Dump ISO creation
sudo pacman -S cabextract wimlib chntpw cdrtools aria2

#Flatpak apps
flatpak install flathub com.github.wwmm.easyeffects
flatpak install flathub net.davidotek.pupgui2

#Clean leftover packages and hide extra icons
./clean-files.sh
./hide-icons.sh