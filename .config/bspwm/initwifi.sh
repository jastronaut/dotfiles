#!/bin/sh

modprobe mwifiex
modprobe -r mwifiex_pcie
modprobe mwifiex_pcie
wait 5
nmcli dev
