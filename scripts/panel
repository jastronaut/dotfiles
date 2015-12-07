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
		then echo -e " %{F$LABEL}$ICON_MUTED   MUTED %{F-}"
	#elif [ $VOLUME -gt '0%' ] && [ $VOLUME -le '50%' ]
	#	then echo -e "%{F$LABEL}VOL   $ICON_VOLUME_LO%{F-}    $VOLUME"
	else
		echo -e "%{F$LABEL}VOL  $ICON_VOLUME_HI%{F-}    $VOLUME"
	fi
}

getBattery() { # battery percentage
	BAT=$(acpi -b | grep -P -o '[0-9]+(?=%)')
	if [ $BAT -le 100 ] && [ $BAT -gt 39 ]
	   then echo -e "%{F$LABEL}BAT%{F-} %{F$GREEN}$ICON_BAT_STATE $BAT%%{F-}"
	elif [ $BAT -lt 40 ] && [ $BAT -gt 19 ]
		then echo "%{F$LABEL}BAT%{F-} %{F$ORANGE}$ICON_BAT_STATE $BAT%%{F-}"
	elif [ $BAT -lt 20 ] && [ $BAT -gt 0 ]
		then echo "%{F$LABEL}BAT%{F-} %{F$RED}$ICON_BAT_STATE $BAT%%{F-}"
	else
		echo -e "%{F$LABEL}BAT%{F-} %{F$GREEN}$ICON_BAT_STATE $BAT%%{F-}"
	fi
}

getMusic() { # get artist and song from playerctl 
	ARTIST="$(playerctl metadata artist)"
	SONG="$(playerctl metadata title)"
	echo -e "%{F$YELLOW}$ICON_MUSIC%{F-} $ARTIST %{F$LABEL} ~ %{F-} $SONG"
}

desk() { # get active workspace
	CUR=$(xprop -root _NET_CURRENT_DESKTOP | awk '{print $3}')
	case $CUR in
		0) echo -e "%{F$BLUE1}$ICON_WS1%{F-}    $ICON_WS2    $ICON_WS3    $ICON_WS4";;
		1) echo -e "$ICON_WS1    %{F$BLUE1}$ICON_WS2%{F-}    $ICON_WS3    $ICON_WS4";;
		2) echo -e "$ICON_WS1    $ICON_WS2    %{F$BLUE1}$ICON_WS3%{F-}    $ICON_WS4";;
		3) echo -e "$ICON_WS1    $ICON_WS2    $ICON_WS3    %{F$BLUE1}$ICON_WS4%{F-}";;
		*) echo "xx"
	esac
}

# print out the stuff in the grossest manner possible
while :; do

    echo -e "%{l} $SEP$(desk) $SEP $(getMusic) $SEP %{c}$(getClock)$SEP$ICON_DATE  $(getCal)  %{r}$(getVolume) $SEP $(getBattery)$SEP"
    sleep 1

done | lemonbar -g ${PW}x${PH}+${PX}+${PY} -f "$PANEL_FONT" -f "$PANEL_FONT2" -F "$FG" -B "$BG" -u 2px -p