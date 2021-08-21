sudo pacman -Rns $(pacman -Qtdq)
sudo pacman -Scc
yay -Scc
rm -rf ~/.cache/*
