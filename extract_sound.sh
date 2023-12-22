#!/bin/sh

# This script will extract the sound files from the vpk
# archives, since there are issues with some sound files
# not being loaded correctly from the vpk files.

set -x

steamdir="$HOME/.steam/debian-installation"
moddir="$steamdir/steamapps/workshop/content/362890/2424633574/bshift"

# check if vpk is install
which vpk > /dev/null
if [ $? -eq 1 ]; then
    pip install vpk
fi
set -e
which vpk > /dev/null

# move into mod directory
cd "$moddir"

# revert backup
if [ -d "BACKUP" ]; then
    rm -rf sound
    mv BACKUP/* .
    rmdir BACKUP
fi

# extract sound
rm -rf OUT
vpk -x OUT bshift_sound_dir.vpk
mkdir -p sound
mv -f OUT/sound/* sound

# move sound vpk files
rm -rf OUT BACKUP
mkdir -p BACKUP
mv bshift_sound_*.vpk BACKUP
rm -f bshift_sound.vpk.sound.cache
