#!/bin/bash

# show progress on console
set -x

# Convert an icon into mobile icons and start screens
# Usage: icons.sh ic-name-of-source-icon.png fgcolormask bgcolortarget destination
# pick a $bgcolor from 
# oracle.com/webfolder/ux/middleware/alta_icon_web_design_guide/colors-icon_palette.html

fgcolor=$2
bgcolor=$3
original=$1
destination=$4

base=icon.png

# replace foreground color with white

#convert $original -fuzz 90% -fill white -opaque $fgcolor $base

# fill background with bgcolor
convert $base -background $bgcolor -flatten $base

# prepare targets
devices=android,ios
eval mkdir -p "$destination/res/{$devices}"

icons="convert $base"

$icons -resize 128 "$destination/res/icon.png"

$icons -resize 36 "$destination/res/android/display-ldpi-icon.png"
$icons -resize 48 "$destination/res/android/display-mdpi-icon.png"
$icons -resize 72 "$destination/res/android/display-hdpi-icon.png"
$icons -resize 96 "$destination/res/android/display-xhdpi-icon.png"
$icons -resize 144 "$destination/res/android/display-xxhdpi-icon.png"
$icons -resize 192 "$destination/res/android/display-xxxhdpi-icon.png"

# iPhone
$icons -resize 120 "$destination/res/ios/icon-50.png"
$icons -resize 180 "$destination/res/ios/icon-50@2x.png"
$icons -resize 87 "$destination/res/ios/icon-29@3x.png"
$icons -resize 120 "$destination/res/ios/icon-40@3x.png"
$icons -resize 60 "$destination/res/ios/icon-60.png"
$icons -resize 120 "$destination/res/ios/icon-60@2x.png"
$icons -resize 180 "$destination/res/ios/icon-60@3x.png"
# Settings
$icons -resize 87 "$destination/res/ios/icon-57.png"
$icons -resize 29 "$destination/res/ios/icon-29.png"
$icons -resize 58 "$destination/res/ios/icon-29@2x.png"
$icons -resize 114 "$destination/res/ios/icon-57@2x.png"
$icons -resize 72 "$destination/res/ios/icon-72.png"
$icons -resize 144 "$destination/res/ios/icon-72@2x.png"
# iPad
$icons -resize 76 "$destination/res/ios/icon-76.png"
$icons -resize 152 "$destination/res/ios/icon-76@2x.png"
$icons -resize 228 "$destination/res/ios/icon-76@3x.png"
# Spotlight
$icons -resize 120 "$destination/res/ios/icon-120.png"
$icons -resize 40 "$destination/res/ios/icon-40.png"
$icons -resize 80 "$destination/res/ios/icon-40@2x.png"
$icons -resize 1024 "$destination/res/ios/iTunesArtwork.png"


# Splash screens
convert="convert $base -gravity center"

$convert -resize 120 -extent 640x1136 "$destination/res/ios/Default-568h@2x.png"
$convert -resize 120 -extent 750x1334 "$destination/res/ios/Default-667h@2x.png"
$convert -resize 144 -extent 1242x2208 "$destination/res/ios/Default-1104h@2x.png"
$convert -resize 60 -extent 320x480 "$destination/res/ios/Default-1135h@2x.png"
$convert -resize 60 -extent 480x320 "$destination/res/ios/Default-Land.png"
$convert -resize 140 -extent 1024x768 "$destination/res/ios/Default-Landscape-Ipad.png"
$convert -resize 140 -extent 1024x768 "$destination/res/ios/Default-Landscape.png"
$convert -resize 280 -extent 2048x1536 "$destination/res/ios/Default-Landscape@2x.png"
$convert -resize 144 -extent 2208x1242 "$destination/res/ios/Default-Landscape-621@2x.png"
$convert -resize 288 -extent 2048x1536 "$destination/res/ios/Default-Landscape@2x~ipad.png"
$convert -resize 144 -extent 1024x768 "$destination/res/ios/Default-LandscapeRetina.png"
$convert -resize 288 -extent 2048x1536 "$destination/res/ios/Default-LandscapeRetina@2x.png"
$convert -resize 144 -extent 768x1004 "$destination/res/ios/Default-Portrait-Ipad.png"
$convert -resize 144 -extent 768x1004 "$destination/res/ios/Default-Portrait.png"
$convert -resize 288 -extent 1536x2008 "$destination/res/ios/Default-Portrait@2x.png"
$convert -resize 144 -extent 768x1024 "$destination/res/ios/Default-PortraitRetina.png"
$convert -resize 288 -extent 1536x2048 "$destination/res/ios/Default-PortraitRetina@2x.png"
$convert -resize 60 -extent 320x480 "$destination/res/ios/Default.png"
$convert -resize 120 -extent 960x640 "$destination/res/ios/Default@2x-Landscape.png"
$convert -resize 120 -extent 640x960 "$destination/res/ios/Default@2x.png"

$convert -resize 144 -extent 1280x800 "$destination/res/android/display-land-hdpi-splashscreen.png"
$convert -resize 96 -extent 800x480 "$destination/res/android/display-land-ldpi-splashscreen.png"
$convert -resize 96 -extent 800x480 "$destination/res/android/display-land-mdpi-splashscreen.png"
$convert -resize 144 -extent 1024x768 "$destination/res/android/display-land-xhdpi-splashscreen.png"

$convert -resize 96 -extent 802x482 "$destination/res/android/display-land-hdpi-splashscreen.9.png"
$convert -resize 96 -extent 802x482 "$destination/res/android/display-land-ldpi-splashscreen.9.png"
$convert -resize 96 -extent 802x482 "$destination/res/android/display-land-mdpi-splashscreen.9.png"
$convert -resize 96 -extent 802x482 "$destination/res/android/display-land-xhdpi-splashscreen.9.png"
$convert -resize 96 -extent 802x482 "$destination/res/android/display-land-xxhdpi-splashscreen.9.png"

$convert -resize 144 -extent 800x1280 "$destination/res/android/display-port-hdpi-splashscreen.png"
$convert -resize 96 -extent 480x800 "$destination/res/android/display-port-ldpi-splashscreen.png"
$convert -resize 96 -extent 480x800 "$destination/res/android/display-port-mdpi-splashscreen.png"
$convert -resize 144 -extent 768x1024 "$destination/res/android/display-port-xhdpi-splashscreen.png"

$convert -resize 96 -extent 482x802 "$destination/res/android/display-port-hdpi-splashscreen.9.png"
$convert -resize 96 -extent 482x802 "$destination/res/android/display-port-ldpi-splashscreen.9.png"
$convert -resize 96 -extent 482x802 "$destination/res/android/display-port-mdpi-splashscreen.9.png"
$convert -resize 96 -extent 482x802 "$destination/res/android/display-port-xhdpi-splashscreen.9.png"
$convert -resize 96 -extent 482x802 "$destination/res/android/display-port-xxhdpi-splashscreen.9.png"

# turn output off
set +x

