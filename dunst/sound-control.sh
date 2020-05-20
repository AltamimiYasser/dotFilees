#!/bin/bash

# change volume

# chack if sound is muted

if [ "$(pacmd list-sinks | awk '/muted/ {print $2}')" = "yes" ]; then
    amixer set Master toggle
fi

    case "$1" in
        -inc)
            amixer set Master 5%+ && volnoti-show $(amixer get Master | grep -Po '[0-9]+(?=%)' | head -1) && paplay '/usr/share/sounds/gnome/default/alerts/drip.ogg'
            ;;

        -dec)
            amixer set Master 5%- && volnoti-show $(amixer get Master | grep -Po '[0-9]+(?=%)' | head -1) && paplay '/usr/share/sounds/gnome/default/alerts/drip.ogg'
            ;;
    esac
