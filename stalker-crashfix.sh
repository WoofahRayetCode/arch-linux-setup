#!/bin/bash
set -e

cd /home/ericparsley/ 
cd .steam
cd steam
cd steamapps
cd common
cd STALKER\ Shadow\ of\ Chernobyl
cd gamedata
find -type f -name "Thumbs.db" -exec rm -i {} \;
cd
cd /home/ericparsley
cd .steam
cd steam
cd steamapps
cd common
cd STALKER\ Clear\ Sky
cd gamedata
find -type f -name "Thumbs.db" -exec rm -i {} \;
cd
cd home/ericparsley/
cd .steam
cd steam
cd steamapps
cd common
cd STALKER\ Call\ of\ Pripyat
cd gamedata
find -type f -name "Thumbs.db" -exec rm -i {} \;
