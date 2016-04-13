#!/bin/bash

if [ "$#" -lt 2 ]; then
echo "Usage: icon.sh name-of-source-icon.png background-color-RGB" > &2
echo
echo "Convert a base oracle (red) icon into a base icon to use with a resource generator" > &2
echo "Outputs a file: icon.png at 1024x1024" >&2
exit 1
fi

# background color to apply behind white icon
bgcolor=$2
# name of image to use as a base icon
original=$1

# replace red foreground color with white
convert $original -fuzz 90% -fill white -opaque red icon.png

# fill background with bgcolor
convert icon.png -background $bgcolor -flatten icon.png

#resize
convert icon.png -resize 1024 icon.png
