#!/bin/bash

BING_IMG_METADATA=$(curl -s 'http://www.bing.com/HPImageArchive.aspx?format=js&idx=0&n=1&mkt=en-US')
BING_IMG_URL="http://www.bing.com"$(echo $BING_IMG_METADATA | jq --raw-output '.images[0].url')
curl -s -o /tmp/mtse-wallpaper $BING_IMG_URL
feh --bg-scale /tmp/mtse-wallpaper
