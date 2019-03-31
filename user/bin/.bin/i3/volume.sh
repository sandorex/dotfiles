#!/bin/bash

STEP=2

case $1 in
	 up)
		  pactl set-sink-mute @DEFAULT_SINK@ 0
		  pactl set-sink-volume @DEFAULT_SINK@ "+${STEP}%"
		  ;;
	 down)
		  pactl set-sink-mute @DEFAULT_SINK@ 0
		  pactl set-sink-volume @DEFAULT_SINK@ "-${STEP}%"
		  ;;
	 mute)
		  pactl set-sink-mute @DEFAULT_SINK@ 1
		  ;;
	 unmute)
		  pactl set-sink-mute @DEFAULT_SINK@ 0
		  ;;
	 toggle)
		  pactl set-sink-mute @DEFAULT_SINK@ toggle
		  ;;
	 *)
		  echo "invalid command (up|down|mute|unmute|toggle)"
		  ;;
esac
