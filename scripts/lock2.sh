#!/bin/bash

scrot /tmp/screen.png
convert /tmp/screen.png -scale 10% -scale 1000% /tmp/screen.png

[[ -f $1 ]] && convert /tmp/screen.png $1 -gravity center -composite -matte /tmp/screen.png

convert /tmp/screen.png -gravity center \ -gravity center -font Reis -pointsize 90 -fill white -annotate +0+100 'locked' /tmp/screen.png - | composite -gravity center ~/scripts/lock.png  - /tmp/screen.png

i3lock -i /tmp/screen.png

rm /tmp/screen.png