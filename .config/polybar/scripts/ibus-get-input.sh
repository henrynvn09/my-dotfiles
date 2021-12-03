TEMP=$(ibus engine)
if [ "$TEMP" = "Bamboo" ]; then
	echo -n 'vn'
else
	echo -n 'us'
fi

if [ "$(xset q | grep Caps | cut -d ' ' -f 10)" = "on" ]; then
	echo -n ' %{F#f7bd77}Caps%{F-}'
fi
