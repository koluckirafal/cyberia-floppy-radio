#!/bin/bash
playlist="find $1 -type f -print > ./playlist.m3u"

eval $playlist
while true; do
	inotifywait -e modify,create,delete,move $1 && \
        eval $playlist
done
