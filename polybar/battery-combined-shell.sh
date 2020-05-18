#!/bin/sh

# get paths
PATH_AC="/sys/class/power_supply/ADP1"
PATH_BATTERY_0="/sys/class/power_supply/BAT1"
PATH_BATTERY_1="/sys/class/power_supply/BAT2"

ac=0
battery_level_0=0
battery_level_1=0
battery_max_0=0
battery_max_1=0

# if charging, assign that to ac
if [ -f "$PATH_AC/online" ]; then
    ac=$(cat "$PATH_AC/online")
fi

# get level of battery 1
if [ -f "$PATH_BATTERY_0/energy_now" ]; then
    battery_level_0=$(cat "$PATH_BATTERY_0/energy_now")
fi

# get max of battery 1
if [ -f "$PATH_BATTERY_0/energy_full" ]; then
    battery_max_0=$(cat "$PATH_BATTERY_0/energy_full")
fi

# get level of battery 2
if [ -f "$PATH_BATTERY_1/energy_now" ]; then
    battery_level_1=$(cat "$PATH_BATTERY_1/energy_now")
fi

# get max of bettery 2
if [ -f "$PATH_BATTERY_1/energy_full" ]; then
    battery_max_1=$(cat "$PATH_BATTERY_1/energy_full")
fi

# get avarage of batteries compined (now and max)
battery_level=$(("$battery_level_0 + $battery_level_1"))
battery_max=$(("$battery_max_0 + $battery_max_1"))

# calculate battery percent for both combined
battery_percent=$(("$battery_level * 100"))
battery_percent=$(("$battery_percent / $battery_max"))

# colors
color_good="#00FF00"
color_averge_good="#7FFF00"
color_averge="#FFFF00"
color_averge_bad="#FFFF00"
color_bad="#FF0000"

# charging
if [ "$ac" -eq 1 ]; then
    icon="#1"

    if [ "$battery_percent" -gt 97 ]; then
        echo "%{F${color_good}} $battery_percent%{F-}"
    else
        echo "%{F${color_good}} $battery_percent%{F-}"
    fi

# not charging
else
    if [ "$battery_percent" -gt 85 ]; then
        icon="%{F${color_good}} $battery_percent%{F-}"
    elif [ "$battery_percent" -gt 60  ]; then
        icon="%{F${color_averge_good}} $battery_percent%{F-}"
    elif [ "$battery_percent" -gt 40 ]; then
        icon="%{F${color_averge}} $battery_percent%{F-}"
    elif [ "$battery_percent" -gt 35 ]; then
        icon="%{F${color_averge_bad}} $battery_percent%{F-}"
    elif [ "$battery_percent" -gt 10 ]; then
        icon="%{F${color_bad}} $battery_percent%{F-}"
    else
        icon="%{F${color_bad}} $battery_percent%{F-}"
    fi

    echo "$icon $battery_percent %"
fi
