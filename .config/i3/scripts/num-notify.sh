#!/bin/bash

function get_num {
xset -q | grep Num | awk '{print $8}'
}

ICON="/usr/share/icons/Faba/48x48/status/dialog-information.svg"
DIR=`dirname "$0"
sleep 0.15`
NUM=`get_num`
if [ "$NUM" = "on" ]; then 
	$DIR/notify-send.sh -i "$ICON" -r 558 -t 1500 "Numlock: On"
else 
	if [ "$NUM" = "off" ]; then
		$DIR/notify-send.sh -i "$ICON" -r 558 -t 1500 "Numlock: Off"
	fi
fi
