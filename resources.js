#!/usr/bin/env node

/**
Generate icon and splash screen resources

Takes an image 'icon.png' and outputs to pre-existing directories res/*

Requires Imagemagick (imagemagick.org)

TODO: Android 9-patch (http://developer.android.com/tools/help/draw9patch.html)
TODO: iOS html splash
*/
(function(specification) {
    var shell = require('child_process');
    for (var location in specification)
        for (var namesize in specification[location])
            (location + specification[location][namesize])
            .replace(/(^\S+) (\d+)x(\d+)?/,
                function(spec, output, width, height) {
                    var command = '/opt/local/bin/convert icon.png ' +
                        (width == height ?
                            '-resize ' + width :
                            '-gravity center -resize ' + Math.floor((Math.min(width, height)) / 5.333) + ' -extent ' + width + 'x' + height) + ' ' + output;
                    console.log(command);
                    shell.exec(command, function(error, stdout, stderr) {
                        stdout && console.log(stdout);
                        stderr && console.log(stderr);
                        if (error)
                            console.log(error);
                    });
                });
})({
    'res/ios/': [
        'iTunesArtwork.png 512x512',

        'Icon-120.png 120x120',
        'Icon-60@3x.png 180x180',
        'Icon-76.png 76x76',
        'Icon-76@2x.png 152x152',

        'Default@2x.png 640x960',
        'Default-568h@2x.png 640x1136',
        'Default-667h@2x.png 750x1334',
        'Default-1104h@2x.png 1242x2208',
        'Default-Landscape-621@2x.png 2208x1242',
        'Default-PortraitRetina.png 768x1024',
        'Default-PortraitRetina@2x.png 1536x2048',
        'Default-LandscapeRetina.png 1024x768',
        'Default-LandscapeRetina@2x.png 2048x1536',

        'Icon-40.png 40x40',
        'Icon-40@2x.png 80x80',
        'Icon-40@3x.png 120x120',

        'Icon-29.png 29x29',
        'Icon-29@2x.png 80x80',
        'Icon-29@3x.png 87x87'
    ],

    'res/android/': [
        'display-ldpi-icon.png 36x36',
        'display-port-ldpi-splashscreen.png 480x800',
        'display-land-ldpi-splashscreen.png 800x480',

        'display-mdpi-icon.png 48x48',
        'display-port-mdpi-splashscreen.png 480x800',
        'display-land-mdpi-splashscreen.png 800x480',

        'display-hdpi-icon.png 72x72',
        'display-port-hdpi-splashscreen.png 800x1280',
        'display-land-hdpi-splashscreen.png 1280x800',

        'display-xhdpi-icon.png 96x96',
        'display-port-xhdpi-splashscreen.png 768x1024',
        'display-land-xhdpi-splashscreen.png 1024x768'
    ]
});

/*
	see also:
		search:
			"icons for universal apps" site:developer.apple.com
		https://developer.apple.com/library/ios/qa/qa1686/_index.html
*/
