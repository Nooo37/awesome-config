#!/bin/sh
# provides a nice rofi menu to chose a new xrdb colorscheme and call the update script

PATHXPRISON="$HOME/code/dots/xprison"

if [ "$1" == "" ] ; then 
    CHOICE=$(ls "$PATHXPRISON/colors" | rofi -dmenu -i -p "Choose a colorscheme: " | tr -d '\n')
else
    CHOICE=$1
fi

# check input
if [ "$CHOICE" == "" ] ; then exit 0; fi
[[ -e "$PATHXPRISON/colors/$CHOICE" ]] || exit

# do new colorscheme by writing a new Xresource file, updating xrdb, calling the update script and restarting awesomeWM
cp "$PATHXPRISON/colors/$CHOICE" "$HOME/.config/X/Xresources"
cat "$PATHXPRISON/base.xres" >> "$HOME/.config/X/Xresources"
xrdb -load "$HOME/.config/X/Xresources"
$PATHXPRISON/update.sh
awesome-client "awesome.restart()"
echo "Success! Colorscheme set to $CHOICE"

