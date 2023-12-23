These are shell scripts used to play [Black Mesa: Blue Shift](https://steamcommunity.com/sharedfiles/filedetails/?id=2424633574)
natively on Linux.
These scripts can be launched anywhere, you don't need to copy them into a specific directory.

__launch_bshift.sh__: Use this script to start the game.
A symbolic link to the mod directory will automatically be generated.

__apply_fixes.sh__:
This script will extract the sound files from the vpk
archives, since there are issues with some sound files
not being loaded correctly from the vpk archive files.
It will also fix the HUD scanlines.

The command `pip` is expected to be installed (`apt install pip`).

To revert these fixes delete the folder `bshift/sound` and the
file `bshift/materials/dev/hud_scanline.vtf`.

__create_desktop_icon.sh__:
Create an icon on your desktop to start the game.

Note: Black Mesa and the workshop data are expected to be inside
sub-directories of `$HOME/.steam/root/steamapps`.
You need to modify the scripts if your installation paths differ.
