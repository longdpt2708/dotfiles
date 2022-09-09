#!/bin/bash

function run {
  if ! pgrep $1 ;
  then
    $@&
  fi
}
# Autostart
picom --experimental-backends --fade-in-step=1 --fade-out-step=1 --fade-delta=0 &
nitrogen --restore &
dunst &
pulseaudio-equalizer enable &>/dev/null & app hset &

$HOME/.config/polybar/launch.sh &

$HOME/.script/ibus.sh &
