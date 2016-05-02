#!/bin/sh
#
# because my goddamned kernel doesn't want to load wifi shit correctly anymore
# idk it just werked until yesterday
# also this needs to be run with sudo

# i have no idea what i'm doing; first line may not be neccessary but this is just copied from my zsh history when i somehow got wifi to work
modprobe mwifiex
modprobe -r mwifiex_pcie
modprobe mwifiex_pcie
# it takes some time to connect
wait 7
# show output of whether or not it worked
nmcli dev
