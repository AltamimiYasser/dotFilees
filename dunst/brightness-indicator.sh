#!/bin/bash

#change brightness

# jsut make up a uniqe number for the message id
msgId="9910492"

# get current and max brightness to calculate the precentage
curr_brightness=$(brightnessctl get)
max_brightness=$(brightnessctl max)

# calculate percent
percentage=$(("$curr_brightness * 100"))
percentage=$(("percentage / $max_brightness"))

case "$1" in
    -inc)
        brightnessctl set +5%
        dunstify -a "changeBrightness" -u low -i /usr/share/icons/Flat-Remix-Blue-Dark/status/symbolic/display-brightness-high-symbolic.svg  -r "$msgId" \
            "Brightness: ${percentage}%"
        echo "+5"
        ;;
    
    -dec)
        brightnessctl set 5%-
        dunstify -a "changeBrightness" -u low -i /usr/share/icons/Flat-Remix-Blue-Dark/status/symbolic/display-brightness-low-symbolic.svg -r "$msgId" \
            "Brightness: ${percentage}%"
        echo "-5"
        ;;
    esac
