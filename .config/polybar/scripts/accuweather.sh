#!/bin/bash

get_icon() {
    case $1 in
        # Icons for weather-icons
        1)icon="";;
        2) icon="";;
        3) icon="";;
        4) icon="";;
        5) icon="";;
        6) icon="";;
        7) icon="";;
        8) icon="";;
        11) icon="";;
        12) icon="";;
        13) icon="";;
        14) icon="";;
        15) icon="";;
        16) icon="";;
        17) icon="";;
        18) icon="";;
        19) icon="";;
        20) icon="";;
        21) icon="";;
        22) icon="";;
        23) icon="";;
        24) icon="";;
        25) icon="";;
        26) icon="";;
        27) icon="";;
        28) icon="";;
        29) icon="";;
        30) icon="";;
        31) icon="";;
        32) icon="";;
        33) icon="";;
        34) icon="";;
        35) icon="";;
        36) icon="";;
        37) icon="";;
        38) icon="";;
        39) icon="";;
        40) icon="";;
        41) icon="";;
        42) icon="";;
        43) icon="";;
        44) icon="";;
        *) icon="";
    esac

    echo $icon
}

APIKEY="yVXjUwRROYQSrE6V1rQ3KC4SU8UHxXQH"
APIKEY1="bQlFJMBiOIRSjlTa5IaQC3KyLAeTEUWm"
METRIC="true"
SYMBOL="°"


location=$(curl -sf https://location.services.mozilla.com/v1/geolocate?key=geoclue)

location_lat="$(echo "$location" | jq '.location.lat')"
location_lon="$(echo "$location" | jq '.location.lng')"

LocationKey=$(curl -sf "http://dataservice.accuweather.com/locations/v1/cities/geoposition/search?apikey=$APIKEY1&q=$location_lat%2C$location_lon" | jq -r '.Key')

DailyForecast=$(curl -sf "http://dataservice.accuweather.com/forecasts/v1/daily/1day/$LocationKey?apikey=$APIKEY&metric=$METRIC")

MaxTemp="$(echo "$DailyForecast" | jq '.DailyForecasts[0].Temperature.Maximum.Value')"
IconId="$(echo "$DailyForecast" | jq '.DailyForecasts[0].Temperature.Maximum.Value')"


get() {
    echo "$(get_icon "$IconId") $MaxTemp$SYMBOL"
}

icon(){
    echo "$IconId"
}

notify(){
    description="$(echo "$DailyForecast" | jq '.Headline.Text')"
    dayW="$(echo "$DailyForecast" | jq '.DailyForecasts[0].Day.IconPhrase')"
    nightW="$(echo "$DailyForecast" | jq '.DailyForecasts[0].Night.IconPhrase')"
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


while getopts "ginh:" OPTION; do
        case "$OPTION" in
        g)
                get
                ;;
        i)
                icon
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
