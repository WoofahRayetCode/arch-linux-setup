#!/bin/bash
set -e

# Function to add repository and key
add_repository() {
    local repo_name="$1"
    local mirror_url="$2"
    local key_id="$3"

    if ! grep -q "\[$repo_name\]" /etc/pacman.conf; then
        sudo echo "[${repo_name}]" | sudo tee -a /etc/pacman.conf > /dev/null
        sudo echo "Server = ${mirror_url}" | sudo tee -a /etc/pacman.conf > /dev/null

        # Import and sign the repository key
        if [ -n "$key_id" ]; then
            sudo pacman-key --recv-keys "$key_id"
            sudo pacman-key --lsign-key "$key_id"
        fi
    fi

    # Initialize pacman-key
    sudo pacman-key --init
    sudo pacman-key --populate archlinux chaotic-aur
}

# Function to install packages using pacman and yay
install_packages() {
    local packages=("$@")
    echo "Installing packages: ${packages[@]}"
    sudo pacman -Syu "${packages[@]}"
    if command -v yay &>/dev/null; then
        yay -S --noconfirm "${packages[@]}"
    fi
}

# Add chaotic AUR repository and key
add_repository chaotic-aur https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst 3056513887B78AEB

# Enable multilib (if not already enabled)
if ! grep -q "\[multilib\]" /etc/pacman.conf; then
    echo "[multilib]" | sudo tee -a /etc/pacman.conf > /dev/null
    echo "Include = /etc/pacman.d/mirrorlist" | sudo tee -a /etc/pacman.conf > /dev/null
fi

# Update pacman databases
sudo pacman -Syyu --noconfirm

# Enable Bluetooth
sudo systemctl start bluetooth.service
sudo systemctl enable bluetooth.service

# Enable parallel downloading
sudo sed -i 's/#ParallelDownloads = 5/ParallelDownloads = 10/' /etc/pacman.conf

# Pacman output colorizating
sudo sed -i 's/#Color/Color/' /etc/pacman.conf

# Change progressbar to pacman
sudo sed -i 's/^VerbosePkgLists/VerbosePkgLists\nILoveCandy/' /etc/pacman.conf

# Install regularly used apps
install_packages base-devel linux-headers jq partitionmanager nvidia-dkms nvidia-settings nvidia-utils lib32-nvidia-utils switcheroo-control ntfs-3g jre-openjdk flatpak bash-language-server usbmuxd mame-tools lib32-mangohud mangohud goverlay vulkan-icd-loader lib32-vulkan-icd-loader lib32-vulkan-mesa-layers vulkan-mesa-layers winetricks protontricks bleachbit gamemode lib32-gamemode steam android-tools

# Needed for UUP Dump ISO creation
install_packages cabextract wimlib chntpw cdrtools aria2

# Needed to start switcheroo service right away
sudo systemctl enable --now switcheroo-control

# Flatpak apps
flatpak install flathub com.github.wwmm.easyeffects
flatpak install flathub org.kde.kdenlive
flatpak install flathub me.proton.Pass
flatpak install flathub com.rustdesk.RustDesk
flatpak install flathub org.standardnotes.standardnotes
flatpak install flathub com.github.Matoking.protontricks
flatpak install flathub org.kde.krita
flatpak install flathub org.libreoffice.LibreOffice
flatpak install flathub io.github.elevenhsoft.WebApps
flatpak install flathub org.kde.krename
flatpak install flathub com.visualstudio.code

# Install yay if not already installed
if ! command -v yay &>/dev/null; then
    git clone https://aur.archlinux.org/yay.git /tmp/yay && cd /tmp/yay
    makepkg -si --noconfirm
fi

# Emulators
install_packages duckstation-git pcsx2-git rpcs3-git ppsspp-git vita3k-git

# Install AUR apps that I use
install_packages envycontrol vk-hdr-layer-kwin6-git vesktop onedrive-abraunegg-git peazip gnome-keyring lmstudio proton-ge-custom-bin umu-launcher sideloader-bin bluemail idevicerestore gcdemu xpadneo-dkms ventoy-bin youtube-music-bin

# Fix for audio on 9i Laptop - Prefer this fix for foreseeable future
curl -s https://raw.githubusercontent.com/DanielWeiner/tas2781-fix-16IRX8H/refs/heads/main/install.sh | bash -s --

# Make 4090 work at full power on 9i laptop - KEEP THIS!
sudo systemctl enable nvidia-powerd.service
sudo systemctl start nvidia-powerd.service

# Clean left over files
wget https://raw.githubusercontent.com/WoofahRayetCode/arch-linux-setup/refs/heads/master/clean_files.sh
chmod +x clean_files.sh
sudo ./clean_files.sh

# Hide icons for program I don't use
wget https://raw.githubusercontent.com/WoofahRayetCode/arch-linux-setup/refs/heads/master/hide_icons.sh
sudo chmod +x hide_icons.sh
sudo ./hide_icons.sh

# CPU boost aggressiveness script
wget https://raw.githubusercontent.com/WoofahRayetCode/arch-linux-setup/refs/heads/master/cpu_boost_switcher.sh
sudo chmod +x cpu_boost_switcher.sh
sudo cp cpu_boost_switcher.sh /usr/local/bin/

# GPU switcher script for hybrid laptop.
wget https://raw.githubusercontent.com/WoofahRayetCode/arch-linux-setup/refs/heads/master/envycontrol_gpu_switcher.sh
sudo chmod +x envycontrol_gpu_switcher.sh
sudo cp envycontrol_gpu_switcher.sh /usr/local/bin/

# Function to check if the CPU is AMD
is_amd_cpu() {
    [[ $(lscpu | grep "Vendor ID" | awk '{print $3}') == "AuthenticAMD" ]]
}

# Install zenergy for AMD systems
if is_amd_cpu; then
    echo "Installing zenergy for AMD system..."
    wget https://raw.githubusercontent.com/WoofahRayetCode/arch-linux-setup/refs/heads/master/zenergy.sh
    chmod +x zenergy.sh
    ./zenergy.sh
else
    echo "Not an AMD CPU, skipping zenergy installation."
fi

# Set up OneDrive
wget https://raw.githubusercontent.com/WoofahRayetCode/arch-linux-setup/refs/heads/master/onedrive_sync_setup.sh
sudo chmod +x onedrive_sync_setup.sh
./onedrive_sync_setup.sh

# Run to sync OneDrive after initial setup
wget https://raw.githubusercontent.com/WoofahRayetCode/arch-linux-setup/refs/heads/master/onedrive_sync.sh
sudo chmod +x onedrive_sync.sh
./onedrive_sync.sh

# Need to run this file at every login so Mangohud can read wattage for Intel CPU
wget https://raw.githubusercontent.com/WoofahRayetCode/arch-linux-setup/refs/heads/master/goverlay_intel_power_reading.sh
sudo chmod +x goverlay_intel_power_reading.sh
