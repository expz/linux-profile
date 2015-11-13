#!/bin/bash
# Records a screencast of the first window containing a given string
# works on fedora 23

TITLE="$1"
WINDOW_XID=$(xwininfo -tree -root -all | egrep -i "$TITLE" | sed -e 's/^ *//' | cut -d\  -f1 | head -1)
SCREENCAST_FILE="/zones/screencasts/sc-$(date +%Y-%m-%d-%H-%M-%S)"
gst-launch-1.0 ximagesrc xid=$WINDOW_XID ! video/x-raw,framerate=30/1 ! videoconvert ! queue ! vp8enc ! mux. webmmux name=mux ! filesink location="${SCREENCAST_FILE}.webm"

