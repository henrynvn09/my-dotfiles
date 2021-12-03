id="$(xinput list | grep -Eo 'AT Translated Set [0-9] keyboard.*id=[0-9]+' | grep -Eo 'id=[0-9]+' | grep -Eo '[0-9]+')"
mode="$(echo "$id" | xargs -I % xinput --list-props % | grep 'Device Enabled' | grep -Eo ':.*[0|1]' | grep -Eo '[0|1]')"

if [ "$mode" -eq "1" ]; then
  xinput set-prop "$id" "Device Enabled" 0 && notify-send "Internal keyboard" "Internal keyboard has been disabled"
  brightnessctl --device='dell::kbd_backlight' set 0
else
  xinput set-prop "$id" "Device Enabled" 1 && notify-send "Internal keyboard" "Internal keyboard has been enabled"
  brightnessctl --device='dell::kbd_backlight' set 2
fi
