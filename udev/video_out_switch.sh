#!/bin/sh
# either my iGPU or display or /usr/bin/xrandr has slight bug where it takes
# a few tries by /usr/bin/xrandr to discover 4k on the external monitor...
# running /usr/bin/xrandr and then the resolution change will get 4k to stick
# you better connect to a monitor with 4k capabilities only!! lol

external_hdmi=$(< /sys/class/drm/card0/card0-HDMI-A-2/status)

if [ "connected" == "$external_hdmi" ]; then
	/usr/bin/xrandr --output HDMI-2 --primary --mode 3840x2160
	while [ $? -ne 0 ]; do
		/usr/bin/xrandr
		/usr/bin/xrandr --output HDMI-2 --primary --mode 3840x2160
 	done
	/usr/bin/xrandr --output eDP-1 --off
else 
	/usr/bin/xrandr --output eDP-1 --primary --mode 1920x1080
	/usr/bin/xrandr --output HDMI-2 --off
fi
