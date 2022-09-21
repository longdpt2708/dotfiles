#!/bin/bash

function run {
  if ! pgrep $1 ;
  then
    $@&
  fi
}
# Autostart
# picom -CGb &
# picom -c --fade-in-step=1 --fade-out-step=1 --fade-delta=0 &
picom --experimental-backends -b --fade-in-step=1 --fade-out-step=1 --fade-delta=0  &
# picom -b --animations --animation-window-mass 0.5 --animation-for-open-window zoom --animation-stiffness 350 &
nitrogen --restore &
dunst &
pulseaudio-equalizer enable &>/dev/null & app hset &

## Polkit authentication
(sleep 2s && /usr/lib/xfce-polkit/xfce-polkit) &

$HOME/.config/polybar/launch.sh &

$HOME/.script/ibus.sh &
