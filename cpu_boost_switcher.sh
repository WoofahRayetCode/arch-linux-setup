#!/bin/bash

# Check if msr-tools is installed
if ! command -v wrmsr &> /dev/null; then
    # If msr-tools is not installed, install it using pacman
    sudo pacman -S --noconfirm msr-tools
fi

# Check if Zenity is installed
if ! command -v zenity &> /dev/null; then
    # If Zenity is not installed, install it using pacman
    echo "Zenity is not installed. Installing now..."
    sudo pacman -S --noconfirm zenity
fi

# Prompt user for CPU EPB choice using Zenity dialog box
choice=$(zenity --list --title="CPU Energy Performance Bias" --text="Choose your mode:" --column "Mode" --column "EPB Value" "Thermal" 0x3 "Balanced Low Power" 0x6 "Balanced High Performance" 0xA "Performance" 0xE)

case $choice in
    "Thermal") echo "Setting Thermal mode"; sudo wrmsr -a 0x1A4 0x3;;
    "Balanced Low Power") echo "Setting Balanced Low Power mode"; sudo wrmsr -a 0x1A4 0x6;;
    "Balanced High Performance") echo "Setting Balanced High Performance mode"; sudo wrmsr -a 0x1A4 0xA;;
    "Performance") echo "Setting Performance mode"; sudo wrmsr -a 0x1A4 0xE;;
    *) echo "Invalid choice. No changes made.";;
esac
