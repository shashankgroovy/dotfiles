#!/bin/sh

# Turns out dunst passes the notification details when it
# calls the script in the form of 
# > script appname summary body icon urgency
#
# Based on that we can mute notifications for some apps

if [ "$1" != "Spotify" ]; then
    paplay /home/shanks/.dotfiles/dunst/sounds/button.mp3;
fi
