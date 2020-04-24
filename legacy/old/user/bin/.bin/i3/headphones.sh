#!/bin/bash

SPEAKER=0
HEADPHONES=1

CURRENT=`pacmd list-sinks | awk '/index:/{i++} /* index:/{print (i - 1); exit}'`

case $1 in
	 toggle)
		  if [ "$CURRENT" == "$SPEAKER" ]; then
			   pactl set-default-sink $HEADPHONES
		  else
				pactl set-default-sink $SPEAKER
		  fi
		  ;;
	 speaker)
		  pactl set-default-sink $SPEAKER
		  ;;
	 headphones)
		  pactl set-default-sink $HEADPHONES
		  ;;
	 *)
		  echo "invalid command (toggle|speaker|headphones)"
		  ;;
esac
