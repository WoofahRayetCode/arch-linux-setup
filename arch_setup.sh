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
sudo pacman -Sy base-devel linux-headers cachyos-gaming-meta linux-cachyos-nvidia nvidia-settings nvidia-utils lib32-nvidia-utils switcheroo-control qt6-wayland glances gamescope envycontrol ntfs-3g jre-openjdk flatpak bash-language-server usbmuxd mame-tools lib32-mangohud mangohud goverlay vulkan-icd-loader lib32-vulkan-icd-loader lib32-vulkan-mesa-layers vulkan-mesa-layers winetricks bleachbit gamemode lib32-gamemode steam android-tools

#Needed for UUP Dump ISO creation
sudo pacman -S cabextract wimlib chntpw cdrtools aria2

#Needed to start switchroo service right away
sudo systemctl enable --now switcheroo-control

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
flatpak install flathub io.github.elevenhsoft.WebApps
flatpak install flathub com.discordapp.Discord
flatpak install flathub net.lutris.Lutris
flatpak install flathub org.kde.krename
flatpak install flathub com.vscodium.codium
flatpak install flathub net.cozic.joplin_desktop

#Run to get better discord set up
curl -O https://raw.githubusercontent.com/bb010g/betterdiscordctl/master/betterdiscordctl
chmod +x betterdiscordctl
udo mv betterdiscordctl /usr/local/bin

#Install yay
sudo pacman -Sy yay

#Emulators
sudo pacman -Syyu
yay -Sy duckstation-git pcsx2-git rpcs3-git ppsspp-git vita3k-git

#install AUR apps that I use
sudo pacman -Sy
yay -Sy makepkg-optimize onedrive-abraunegg-git peazip gnome-keyring intel-ucode-git obs-studio-tytan652 msty-bin proton-ge-custom-bin umu-launcher sideloader-bin bluemail idevicerestore gcdemu xpadneo-dkms ventoy-bin youtube-music-bin brave

#Important Drivers?
yay -Sy mkinitcpio-firmware 

#Fix for audio on 9i Laptop - Perfer this fix for foreseeable future
curl -s https://raw.githubusercontent.com/DanielWeiner/tas2781-fix-16IRX8H/refs/heads/main/install.sh | bash -s --

#Make 4090 work at full power on 9i laptop - KEEP THIS!
sudo systemctl enable nvidia-powerd.service
sudo systemctl start nvidia-powerd.service

#Clean left over files from AUR stuff
./clean-files.sh

#Hide icons in programs menu that I don't want to see
./hide-icons.sh
