#!/bin/bash

# Check if Zenity is installed
if ! command -v zenity &> /dev/null; then
    # If Zenity is not installed, install it using pacman and run with sudo
    echo "Zenity is not installed. Installing now..."
    sudo pacman -S --noconfirm zenity
fi

# Prompt user for GPU mode choice using Zenity dialog box
choice=$(zenity --list --title="GPU Mode" --text="Choose your GPU Mode:" --column "Mode" "Integrated" "Hybrid" "Nvidia")

case $choice in
    "Integrated") echo "Setting Integrated mode"; sudo envycontrol -s integrated;;
    "Hybrid") echo "Setting Hybrid mode"; sudo envycontrol -s hybrid;;
    "Nvidia") echo "Setting Nvidia mode"; sudo envycontrol -s nvidia;;
    *) echo "Invalid choice. No changes made.";;
esac
