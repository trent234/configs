#!/bin/sh

if [ $(xssstate -s) == "disabled" ];
then
	xset s 600
else
	xset s 0
fi
