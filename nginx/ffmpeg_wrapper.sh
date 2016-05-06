#!/bin/sh

[ -n "$2" ] && RTMP_TARGET="$2"

exec /usr/bin/ffmpeg -i "$1" \
	-threads 0 \
	-c:v libx264 -preset:v fast -pix_fmt:v yuv420p -s:v 1280x720 -r:v 60 -g:v 120 -b:v 3500k -minrate:v 3500k -maxrate:v 3500k -bufsize:v 3500k \
	-c:a aac -b:a 160k -ar:a 44100 \
	-f flv "${RTMP_TARGET}"

