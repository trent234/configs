#!/bin/sh

if [ $(xssstate -s) == "disabled" ];
then
	printf "-"
else
	tosleep=$(($(xssstate -t) / 1000))
	if [ $tosleep -gt 60 ];
	then
		tosleep="$(($tosleep / 60))"
		unit="m"
		printf "$tosleep$unit"
	else
		unit="s"
		printf "$tosleep$unit"
	fi
fi
