#!/bin/sh

[ -n "$2" ] && RTMP_TARGET="$2"

[ -z "$RTMP_TARGET" ] && exit 0

echo "$1 -> $RTMP_TARGET" > /config/ffmpeg.log
echo >> /config/ffmpeg.log

exec /usr/bin/ffmpeg -i "$1" \
	-threads 0 \
	-c:v libx264 -preset medium -pix_fmt yuv420p -profile main -s 1280x720 -r 60 -g 120 -b:v 3500k -minrate 3500k -maxrate 3500k -bufsize 3500k \
	-c:a aac -b:a 160k -ar 44100 \
	-f flv "${RTMP_TARGET}" >>/config/ffmpeg.log 2>&1

