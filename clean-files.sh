#!/bin/bash
set -e

sudo pacman -Rns $(pacman -Qtdq)
sudo pacman -Scc
yay -Scc
sudo rm -rf ~/.cache/*
