#!/bin/bash

# change volume

# chack if sound is muted

if [ "$(pacmd list-sinks | awk '/muted/ {print $2}')" = "yes" ]; then
    amixer set Master toggle
fi

# check if sound is playing
palying=$(pacmd list-sink-inputs | grep -c 'state: RUNNING')
echo "$palying"
echo "before this line"

    case "$1" in
        -inc)
            if [[ $palying == 1 ]]; then
                amixer set Master 5%+ && volnoti-show $(amixer get Master | grep -Po '[0-9]+[?=%]' | head -1)
                echo "playing = $palying"
            else

                amixer set Master 5%+ && volnoti-show $(amixer get Master | grep -Po '[0-9]+(?=%)' | head -1) && paplay '/usr/share/sounds/gnome/default/alerts/drip.ogg'
                echo "playing = $palying"
            fi
            ;;

        -dec)
            if [[ $palying == 1 ]]; then
                amixer set Master 5%- && volnoti-show $(amixer get Master | grep -Po '[0-9]+[?=%]' | head -1)
                echo "playing = $palying"
            else
                amixer set Master 5%- && volnoti-show $(amixer get Master | grep -Po '[0-9]+(?=%)' | head -1) && paplay '/usr/share/sounds/gnome/default/alerts/drip.ogg'
                echo "playing = $palying"
            fi
            ;;
    esac
