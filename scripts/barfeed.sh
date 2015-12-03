#!/bin/bash

# get config
. ~/scripts/bar_config.sh

getClock() { # time
    date '+%H:%M'
}

getCal() { # date
	date '+%a %b %d, %Y'
	echo "$date"
}

getBattery() { # battery percentage
	BAT=`acpi -b | grep -P -o '[0-9]+(?=%)'`

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

ws() { # workspace numbers
	all=`xprop -root _NET_NUMBER_OF_DESKTOPS | awk '{print $3}'`
 	ws=`xprop -root _NET_CURRENT_DESKTOP | awk '{print $3}'`
 	echo "[ %{F$YELLOW}$ws%{F-} ] / $all"
}

getCmus() { # cmus status
		C_REMOTE=$(cmus-remote -Q)
		Instance=$(echo -e "$C_REMOTE" | wc -l)
		if [ $Instance = 1 ]
			then echo "%F{$LABEL} ~ %{F-}"
		else
			Cur_song=$(echo "$C_REMOTE" | grep tag | head -n 3 | sort -r | cut -d ' ' -f 3- )
			artist=$(echo -e "$Cur_song" | head -n 2 | tail -n 1)
			title=$(echo -e "$Cur_song" | head -n 1 )
	    	echo -e "$artist %{F$LABEL}~%{F-} $title"
	    fi
}

# print out the stuff in the grossest manner possible
while :; do

    echo "%{l}$SEP$SEP$(ws)$SEP$SEP$(getCmus) %{c}$(getClock)$SEP$(getCal) %{r} $(getBattery)$SEP$SEP"
    sleep 1

done | lemonbar -g ${PW}x${PH}+${PX}+${PY} -f "$PANEL_FONT" -F "$FG" -p -d