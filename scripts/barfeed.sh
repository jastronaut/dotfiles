#!/bin/bash
#
# lemonbar config by jastronaut
## features: clock, date, volume level, battery (with color indicator), current song, and workspace status
#

# get config
. ~/scripts/bar_config.sh

getClock() { # time
    date '+%H:%M'
}

getCal() { # date
	date '+%a %b %d, %Y'
	echo "$date"
}
getVolume() { # get volume level from alsa thing
	VOLUME=$(amixer get Master | grep % | sed -n 1p | awk -F '[' '{print $2}' | awk -F ']' '{print $1}')

	if [ $VOLUME = '0%' ];
		then echo -n " %{F$LABEL} MUTED %{F-} "
	else
		echo -n " %{F$LABEL}VOL %{F-} $VOLUME "
fi
}

getBattery() { # battery percentage
	BAT=$(acpi -b | grep -P -o '[0-9]+(?=%)')

	if [ $BAT -le 100 ] && [ $BAT -gt 39 ]
	   then echo "%{F$LABEL}BAT%{F-} %{F$GREEN}$BAT%%{F-}"
	elif [ $BAT -lt 40 ] && [ $BAT -gt 19 ]
		then echo "%{F$LABEL}BAT%{F-} %{F$ORANGE}$BAT%%{F-}"
	elif [ $BAT -lt 20 ] && [ $BAT -gt 0 ]
		then echo "%{F$LABEL}BAT%{F-} %{F$RED}$BAT%%{F-}"
	else
		echo "%{F$LABEL}BAT%{F-} %{F$GREEN}$BAT%%{F-}"
	fi
}

getMusic() { # get artist and song from playerctl 
	ARTIST="$(playerctl metadata artist)"
	SONG="$(playerctl metadata title)"
	echo "%{U$PURPLE} $ARTIST %{U-} %{F$LABEL} ~ %{F-} $SONG"
}

desk() { # get active desktop status
	CUR=$(xprop -root _NET_CURRENT_DESKTOP | awk '{print $3}')
	case $CUR in
		0) echo "%{F$BLUE1}I%{F-}    II    III";;
		1) echo "I    %{F$BLUE1}II%{F-}    III";;
		2) echo "I    II    %{F$BLUE1}III%{F-}";;
		*) echo "xx"
	esac
}

# print out the stuff in the grossest manner possible
while :; do

    echo "%{l} $SEP$SEP$(desk) $SEP$SEP $(getMusic) $SEP$SEP  %{c}$(getClock)$SEP$(getCal)  %{r}$(getVolume) $SEP$SEP $(getBattery)$SEP$SEP"
    sleep 1

done | lemonbar -g ${PW}x${PH}+${PX}+${PY} -f "$PANEL_FONT" -F "$FG" -u 2px -p -d