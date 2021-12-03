#!/bin/bash

function get_caps {
xset -q | grep Caps | awk '{print $4}'
}

ICON="/usr/share/icons/Faba/48x48/status/dialog-information.svg"
DIR=`dirname "$0"
sleep 0.15`
CAPS=`get_caps`
if [ "$CAPS" = "on" ]; then 
	$DIR/notify-send.sh -i "$ICON" -r 557 -t 1500 "Capslock: On"
else 
	if [ "$CAPS" = "off" ]; then
		$DIR/notify-send.sh -i "$ICON" -r 557 -t 1500 "Capslock: Off"
	fi
fi