#!/bin/sh

steamdir="$HOME/.steam/root"
bmdir="$steamdir/steamapps/common/Black Mesa"
moddir="$steamdir/steamapps/workshop/content/362890/2424633574/bshift"

# create symlink to mod directory if needed
if [ ! -e "$bmdir/bshift" ]; then
    ln -s "$moddir" "$bmdir/bshift"
fi

# We cannot use "steam -applaunch" because it will launch bshift with
# the new game UI which is broken on Linux.
#steam -applaunch 362890 -game bshift 2>&1 | tee "$bmdir/bshift.log"

steampid="$(cat ~/.steampid)"

if ps -p $steampid > /dev/null
then
    "$steamdir/ubuntu12_32/steam-runtime/run.sh" \
        "$bmdir/bms.sh" -game bshift 2>&1 | \
        tee "$bmdir/bshift.log"
    exit $?
else
    echo "Steam needs to be running in order to start the game!"
    echo ""
    read -p "(press ENTER to continue)" var
    exit 1
fi
