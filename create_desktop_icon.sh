#!/bin/sh
set -e
set -x

cd "$(dirname "$0")"

steamdir="$HOME/.steam/debian-installation"
moddir="$steamdir/steamapps/workshop/content/362890/2424633574"

# get $XDG_DESKTOP_DIR
. "$HOME/.config/user-dirs.dirs"

# create .desktop file
cat <<EOF> "$XDG_DESKTOP_DIR/bshift.desktop"
[Desktop Entry]
Type=Application
Name=Black Mesa: Blue Shift
Exec=$PWD/launch_bshift.sh
Icon=$moddir/bshift_icon.ico
Terminal=1
StartupNotify=true
EOF

# make executable
chmod a+x "$XDG_DESKTOP_DIR/bshift.desktop"
