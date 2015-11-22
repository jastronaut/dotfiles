#!/bin/bash

# Dependencies: imagemagick, i3lock-color-git, scrot
# From i3lock-fancy

IMAGE=/tmp/i3lock.png

VALUE="60" #brightness value to compare to
scrot $IMAGE
COLOR=`convert $IMAGE -colorspace hsb -resize 1x1 txt:- | sed -E '/.*$/ {
                             N
                             s/.*\n.*([0-9]{1,2}[^\.])\.[0-9]+%\)$/\1/
                             }'`;
if [ "$COLOR" -gt "$VALUE" ]; then #white background image and black text
    convert $IMAGE -level 0%,100%,0.6 -filter Gaussian -resize 50% -define filter:sigma=4.5 -resize 200% -font Liberation-Sans -pointsize 26 -fill black -gravity center -annotate +0+160 'Type password to unlock' - | composite -gravity center lockdark.png - $IMAGE
    i3lock -i $IMAGE
else #black
    convert $IMAGE -level 0%,100%,0.6 -filter Gaussian -resize 50% -define filter:sigma=4.5 -resize 200% -font Liberation-Sans -pointsize 26 -fill white -gravity center -annotate +0+160 'Type password to unlock' - | composite -gravity center lock.png - $IMAGE
    i3lock -i $IMAGE
fi
rm $IMAGE
