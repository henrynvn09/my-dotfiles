#!/usr/bin/env bash

# -----------------------------------------------------------------------------
# Info:
#   author:    Miroslav Vidovic
#   file:      web-search.sh
#   created:   24.02.2017.-08:59:54
#   revision:  ---
#   version:   1.0
# -----------------------------------------------------------------------------
# Requirements:
#   rofi
# Description:
#   Use rofi to search the web.
# Usage:
#   web-search.sh
# -----------------------------------------------------------------------------
# Script:

declare -A URLS

URLS=(
  ["google"]="https://www.google.com/search?q="
  ["bing"]="https://www.bing.com/search?q="
  ["yahoo"]="https://search.yahoo.com/search?p="
  ["duckduckgo"]="https://www.duckduckgo.com/?q="
  ["yandex"]="https://yandex.ru/yandsearch?text="
  ["github"]="https://github.com/search?q="
  ["goodreads"]="https://www.goodreads.com/search?q="
  ["stackoverflow"]="http://stackoverflow.com/search?q="
  ["searchcode"]="https://searchcode.com/?q="
  ["openhub"]="https://www.openhub.net/p?ref=homepage&query="
  ["superuser"]="http://superuser.com/search?q="
  ["rottentomatoes"]="https://www.rottentomatoes.com/search/?search="
  ["piratebay"]="https://thepiratebay.org/search/"
  ["youtube"]="https://www.youtube.com/results?search_query="
  ["vimawesome"]="http://vimawesome.com/?q="

  ["google arch linux"]="https://www.google.com/search?q=arch linux "
  ["notion"]="https://www.notion.so/"
  ["calendar"]="https://calendar.google.com/"
  ["tradingview"]="https://tradingview.com/"
  ["facebook"]="https://facebook.com/"

  ["thesaurus"]="https://www.wordhippo.com/what-is/another-word-for/"
)

# List for rofi
gen_list() {
    for i in "${!URLS[@]}"
    do
      echo "$i"
    done
}

main() {
  # Pass the list to rofi
  platform=$( (gen_list) | rofi -dmenu -matching fuzzy -no-custom -location 0 -p "Search > " )

  if [[ -n "$platform" ]]; then
    #open webs instead of search
    if [[ "$platform" =~ ^(notion|calendar|tradingview|facebook)$ ]]; then
      url=${URLS[$platform]}
      firefox --new-tab "$url"
      exit
    fi
    query=$( (echo ) | rofi  -dmenu -matching fuzzy -location 0 -p "Query > " )

    if [[ -n "$query" ]]; then
      url=${URLS[$platform]}$query
      firefox --new-tab "$url"
    else
      exit
    fi

  else
    exit
  fi
}

main

exit 0
