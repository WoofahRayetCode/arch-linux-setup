#!/bin/bash
set -e

cd /usr/share/applications
sudo rm -f org.kde.cuttlefish.desktop
sudo rm -f electron24.desktop
sudo rm -f fluid.desktop
sudo rm -f yad-icon-browser.desktop
sudo rm -f qvidcap.desktop
sudo rm -f yad-settings.desktop
sudo rm -f org.kde.kmenuedit.desktop
sudo rm -f uxterm.desktop
sudo rm -f xterm.desktop
sudo rm -f org.kde.plasmaengineexplorer.desktop
sudo rm -f org.kde.plasma.lookandfeelexplorer.desktop
sudo rm -f org.kde.plasma.themeexplorer.desktop
sudo rm -f assistant.desktop
sudo rm -f designer.desktop
sudo rm -f linguist.desktop
sudo rm -f qdbusviewer.desktop
sudo rm -f org.kde.kuserfeedback-console.desktop
sudo rm -f duckstation-nogui.desktop
sudo rm -f ppsspp-sdl.desktop
sudo rm -f io.mgba.mGBA.desktop
sudo rm -f bssh.desktop
sudo rm -f bvnc.desktop
sudo rm -f qv4l2.desktop
sudo rm -f avahi-discover.desktop
sudo rm -f lstopo.desktop
sudo rm -f org.kde.plasma.emojier.desktop
sudo rm -f stoken-gui-small.desktop
sudo rm -f stoken-gui.desktop
sudo rm -f assistant-qt4.desktop
sudo rm -f designer-qt4.desktop
sudo rm -f linguist-qt4.desktop
sudo rm -f qdbusviewer-qt4.desktop

cd

cd /home/ericparsley/.local/share/applications
sudo rm -f org.kde.drkonqi.coredump.gui.desktop
