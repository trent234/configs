#!/bin/sh

full=$(cat /sys/class/power_supply/BAT1/energy_full_design) 
current=$(cat /sys/class/power_supply/BAT1/energy_now) 
fraction=$(bc <<<"scale=4;$current/$full")
percent=$(bc <<<"scale=2;$fraction*100/1")

if [ $(cat /sys/class/power_supply/BAT1/status) == "Charging" ];
then
	status="+"
elif [ $(cat /sys/class/power_supply/BAT1/status) == "Discharging" ];
then
	status="-"
fi

echo "$status$percent%"

