#!/bin/sh

set -x

steamdir="$HOME/.steam/debian-installation"
moddir="$steamdir/steamapps/workshop/content/362890/2424633574/bshift"

# move into mod directory
cd "$moddir"

# revert backup
if [ -d "BACKUP" ]; then
    rm -rf sound
    mv BACKUP/* .
    rmdir BACKUP
fi
