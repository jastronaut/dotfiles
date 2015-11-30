#!/bin/sh

FONT1="Drucifer for Powerline:size=12"

# CD="~/.Xresources"
# 
# # Fetch the Colors
FG="#C0C5CE"
BG="#2B303B"
GREEN="#D08770"
# Panel 
PW=2160
PH=20
PX=0
PY=0

SEP1="%{B$BG}%{F$GREEN}%{F-}%{B-}"
SEP2="%{B$GREEN}%{F$BG}%{F-}%{B-}"

# while :; do read line; eval $line; done &

getClock() {
    date '+%H:%M:%S'
}

getCal() {
	date '+%a %b %d, %Y'
}

getBattery() {
    cat /sys/class/power_supply/BAT0/capacity
}

#groups() {
#    cur=`xprop -root _NET_CURRENT_DESKTOP | awk '{print $3}'`
#    tot=`xprop -root _NET_NUMBER_OF_DESKTOPS | awk '{print $3}'`
#
#    for w in `seq 0 $((cur - 1))`; do line="${line}="; done
#    line="${line}|"
#    for w in `seq $((cur + 2)) $tot`; do line="${line}="; done
#    echo $line
#}

ws(){
	i3-msg -t get_outputs | sed 's/.*"current_workspace":"\([^"]*\)".*/\1/'
}

while :; do
    LIFE="%{F$BG}%{B$GREEN}LIFE: $(getBattery)%{B-}"
    TIME="%{B$BG}time : $(getClock)%{B-}"
    DATE="%{F$BG}%{B$GREEN}cal: $(getCal)%{B-}"
    DESK="%{B$BG}DESK: $(ws)%{B-}"
    echo $LIFE$SEP1$TIME$SEP2$DATE$SEP1$DESK$SEP2
    sleep 1
done |
lemonbar -g ${PW}x${PH}+${PX}+${PY} -f "$FONT1" -F "$FG" -B "$GREEN" -p -d