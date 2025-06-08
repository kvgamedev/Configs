#!/bin/bash

NETWORK=$(nmcli d wifi | rofi -dmenu -i -p "Networks")

[ -z $NETWORK ] && exit

nmcli d wifi connect $NETWORK
