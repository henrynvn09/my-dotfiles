#!/bin/sh

get_icon() {
    case $1 in
        # Icons for weather-icons
	t01d) icon="";;
        t01n) icon="";;
        t02d) icon="";;
        t02n) icon="";;
        t03d) icon="";;
        t03n) icon="";;
        t04d) icon="";;
        t04n) icon="";;
        t05d) icon="";;
        t05n) icon="";;
        d0*d) icon="";;
        d0*n) icon="";;
        r01d) icon="";;
        r01n) icon="";;
        r02d) icon="";;
        r02n) icon="";;
        r03*) icon="";;
        f01d) icon="";;
        f01n) icon="";;
        r04d) icon="";;
        r04n) icon="";;
        r05d) icon="";;
        r05n) icon="";;
        r06d) icon="";;
        r06n) icon="";;
        s01d) icon="";;
        s01n) icon="";;
        s02*) icon="";;
        s03*) icon="";;
        s04d) icon="";;
        s04n) icon="";;
        s05*) icon="";;
        s06d) icon="";;
        s06n) icon="";;
        a0*d) icon="";;
        a0*n) icon="";;
        c01d) icon="";;
        c01n) icon="";;
        c02d) icon="";;
        c02n) icon="";;
        c03d) icon="";;
        c03n) icon="";;
        c04d) icon="";;
        c04n) icon="";;
        *) icon="";
    esac

    echo $icon
}

KEY="87475885b80a434d8c076d04bfba9fd1"
UNITS="I"
SYMBOL="°"

API="https://api.weatherbit.io/v2.0/forecast/daily"

location=$(curl -sf https://location.services.mozilla.com/v1/geolocate?key=geoclue)

location_lat="$(echo "$location" | jq '.location.lat')"
location_lon="$(echo "$location" | jq '.location.lng')"

forecast=$(curl -sf "$API/?lat=$location_lat&lon=$location_lon&units=$UNITS&key=$KEY")

if [ "$(date +%H%M)" -lt "1700" ]; then
    tomorrow=0
    noti="today "
else
    tomorrow=1
    noti="tomorrow "
fi

forecast_maxtemp=$(echo "$forecast" | jq ".data[$tomorrow].max_temp" | cut -d "." -f 1)
forecast_mintemp=$(echo "$forecast" | jq ".data[$tomorrow].min_temp" | cut -d "." -f 1)
forecast_icon=$(echo "$forecast" | jq -r ".data[$tomorrow].weather.icon")

feelcool_temp=50

if [ -z "$forecast_maxtemp" ]; then
    echo ""
    exit 0
fi

if [ "$forecast_maxtemp" -gt "$feelcool_temp" ]; then
    forecast_temp=$forecast_maxtemp
    indicator='max'
else
    forecast_temp=$forecast_mintemp
    indicator='min'
fi
	
get() {
	echo "$(get_icon "$forecast_icon") $forecast_temp$SYMBOL"
}

notify(){
    description=$(echo "$forecast" | jq ".data["$tomorrow"].weather.description" | cut -d '"' -f 2)
    notify-send -t 8000 -u normal " Weather forecast $noti" -i ~/.config/polybar/scripts/weather-icon.png "  $description\n  $indicator $forecast_temp$SYMBOL\F"
}


usage() {
        echo "Usage: ./weatherforecast.sh [options]
Options:
-g  get max temp or min temp of today
-n  send notify about today description"
}

if [[ "$1" == "" ]]; then
        usage
        exit 0
fi


while getopts "gnh:" OPTION; do
        case "$OPTION" in
        g)
                get
                ;;
        n)
                notify
                ;;
        h)
                usage
                ;;
        *)
                usage
                exit 1
                ;;
        esac
done

