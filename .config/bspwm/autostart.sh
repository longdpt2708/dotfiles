#!/bin/bash

function run {
  if ! pgrep $1 ;
  then
    $@&
  fi
}
# Autostart
picom -CGb --fade-in-step=1 --fade-out-step=1 --fade-delta=0 &
nitrogen --restore &
dunst &
pulseaudio-equalizer enable &>/dev/null & app hset &

## Polkit authentication
(sleep 2s && /usr/lib/xfce-polkit/xfce-polkit) &

$HOME/.config/polybar/launch.sh &

$HOME/.script/ibus.sh &

alias lf="$HOME/.local/bin/lfub"
