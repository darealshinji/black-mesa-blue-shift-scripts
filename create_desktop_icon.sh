#!/bin/sh
set -e
set -x

scriptdir="$(cd "$(dirname "$0")" && echo "$PWD")"
moddir="$HOME/.steam/root/steamapps/workshop/content/362890/2424633574"

# get $XDG_DESKTOP_DIR
desktop="$(xdg-user-dir DESKTOP)"

if [ "x$desktop" = "x" ]; then
    . "$HOME/.config/user-dirs.dirs"
    desktop="$XDG_DESKTOP_DIR"
fi

if [ "x$desktop" = "x" ]; then
    set +x
    echo "cannot find out path to desktop (XDG_DESKTOP_DIR)"
    exit 1
fi

# create .desktop file
cat <<EOF> "$desktop/bshift.desktop"
[Desktop Entry]
Type=Application
Name=Black Mesa: Blue Shift
Exec="$scriptdir/launch_bshift.sh"
Icon=$moddir/bshift_icon.ico
Terminal=1
StartupNotify=true
EOF

# make executable
chmod a+x "$desktop/bshift.desktop"
