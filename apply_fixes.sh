#!/bin/sh
set -x

steamdir="$HOME/.steam/root"
bmsdir="$steamdir/steamapps/common/Black Mesa/bms"
moddir="$steamdir/steamapps/workshop/content/362890/2424633574/bshift"

# check if vpk is install
which vpk > /dev/null
if [ $? -eq 1 ]; then
    pip install vpk
fi
set -e
which vpk > /dev/null

cd "$moddir"
rm -rf OUT sound

# fix HUD scanlines
vpk -x OUT -f '*hud_scanline*' "$bmsdir/bms_textures_dir.vpk"
mkdir -p materials/dev
cp -f OUT/materials/dev/hud_scanline.vtf materials/dev/
rm -rf OUT

# extract sound
vpk -x OUT bshift_sound_dir.vpk
mv OUT/sound .
rm -rf OUT
