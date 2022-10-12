#!/bin/bash
set -e

cd /usr/share/applications
sudo rm -f electron19.desktop
sudo rm -f guiscrcpy.desktop
sudo rm -f assistant.desktop
sudo rm -f designer.desktop
sudo rm -f linguist.desktop
sudo rm -f org.kde.kuserfeedback-console.desktop
sudo rm -f xdvi.desktop
sudo rm -f bssh.desktop
sudo rm -f bvnc.desktop
sudo rm -f firedragon.desktop
sudo rm -f xdman.desktop
sudo rm -f org.pipewire.Helvum.desktop
sudo rm -f avahi-discover.desktop
sudo rm -f org.kde.plasma.emojier.desktop
sudo rm -f vim.desktop
sudo rm -f yad-settings.desktop
sudo rm -f brave-browser.desktop
sudo rm -f libinput-gestures-qt.desktop
sudo rm -f stoken-gui.desktop
sudo rm -f stoken-gui-small.desktop

cd

cd /home/ericparsley/.local/share/applications
sudo rm -f yad-icon-browser.desktop
sudo rm -f qdbusviewer.desktop
sudo rm -f libinput-gestures-qt.desktop
sudo rm -f yad-settings.desktop
sudo rm -f micro.desktop
sudo rm -f kvantummanager.desktop

cd

cd /var/lib/flatpak/exports/share/applications
sudo rm -f io.mgba.mGBA.desktop
sudo rm -f net.pcsx2.PCSX2.desktop
