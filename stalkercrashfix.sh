#!/bin/bash
set -e

cd /home/ericparsley/GAMES/Steam/steamapps/common/STALKER\ Clear\ Sky/gamedata
find -type f -name "Thumbs.db" -exec rm -i {} \;
cd

cd /home/ericparsley/GAMES/Steam/steamapps/common/STALKER\ Shadow\ of\ Chernobyl/gamedata
find -type f -name "Thumbs.db" -exec rm -i {} \;

cd /home/ericparsley/GAMES/Steam/steamapps/common/STALKER\ Call\ of\ Pripyat/gamedata
find -type f -name "Thumbs.db" -exec rm -i {} \;
cd
