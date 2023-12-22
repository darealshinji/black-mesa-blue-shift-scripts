These are shell scripts used to play [Black Mesa: Blue Shift](https://steamcommunity.com/sharedfiles/filedetails/?id=2424633574)
natively on Linux.
These scripts can be launched anywhere, you don't need to copy them into a specific directory.

__launch_bshift.sh__: Use this script to start the game.
A symbolic link to the mod directory will automatically be generated.

__fix_sound.sh__:
This script will extract the sound files from the vpk
archives, since there are issues with some sound files
not being loaded correctly from the vpk archive files.
The command `pip` is expected to be installed (`apt install pip`).

__create_desktop_icon.sh__:
Create an icon on your desktop to start the game.

Note: Black Mesa and the workshop data are expected to be inside sub-directories of
`$HOME/.steam/debian-installation/steamapps`.
You need to modify the scripts if your installation paths differ.
