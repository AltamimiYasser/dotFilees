
* The example config file for polybar is in `/us/share/doc/polybar/config` and we can copy it to `~/.config/polybar`
* to launch polybar we shuld create a script in `~/.config/polybar/launch.sh`
* put this inside the script:

```
#!/bin/bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch Polybar, using default config location ~/.config/polybar/config
polybar mybar &

echo "Polybar launched..."

```

* the tray icons can be get larger by adding `tray-maxsize` in the `config` file.

