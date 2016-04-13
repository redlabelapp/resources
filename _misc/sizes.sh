#!/bin/bash

# Find all image dimensions for pngs within the current directory, 
# and the largest square to use as a base icon
	
    for image in $(find . -name '*.png'); do
    	echo $image

    	dimensions=$(/opt/local/bin/identify $image | cut -d' ' -f3)
    	echo $dimensions

    	width=$(echo $dimensions | cut -d'x' -f1)
    	height=$(echo $dimensions | cut -d'x' -f2)

    	# determine the largest square image to use as an icon base
    	max=0
    	if [[ $width == $height && $width > $icon ]]; then
    			max=$width
    			base_icon=$image
    	fi
    done
