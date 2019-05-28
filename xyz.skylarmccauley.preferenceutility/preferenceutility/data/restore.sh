#!/bin/sh

clear
VER="1.0"
echo "preferenceutility-restore.sh v$VER"

PREFSDIR="/private/var/mobile/Library/Preferences"

DATE=$(date +%m-%d-%Y)
DIRECTORY=`dirname $0`

if [[ $EUID -ne 0 ]]; then
        echo "Please run this script as root!" 
        exit 1;
fi

# Change directory to directory of current shell script
cd $DIRECTORY

echo "Checking r/w permissions needed for restore..."
    if [ ! -w $PREFSDIR ]; then
        echo "Cannot read $PREFSDIR. Try running as root?"
        pause
        main_menu
    fi

cp -afv "./prefs/." "$PREFSDIR/"
echo "Finished restoring backup!"
read -p "Would you like to Respring? [Y/N]" -n 1 -r
        echo
        if [[ $REPLY =~ ^[Yy]$ ]]; then
            echo "Killing SpringBoard..."
            sbreload || killall SpringBoard
        else
        exit 0;
        fi