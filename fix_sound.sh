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

# extract sound
rm -rf OUT sound
vpk -x OUT bshift_sound_dir.vpk
mv OUT/sound .
rm -rf OUT
