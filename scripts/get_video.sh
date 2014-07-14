#!/bin/sh

# $1 the URL to download
# $2 the filename

WORK_DIR=/tmp/dragonfly
MAX_LENGTH=300

DOWNLOAD_FILE="$WORK_DIR/input-$2.%(ext)s"
OUTPUT_FILE="$WORK_DIR/output-$2.avi"
URL=$1

echo Downloading $URL to $DOWNLOAD_FILE
youtube-dl --max-filesize 1024m "$URL" -o "$DOWNLOAD_FILE"
avconv -i "$DOWNLOAD_FILE" -vcodec mpeg4 -qscale 8 -r 30 -acodec copy -t $MAX_LENGTH "$OUTPUT_FILE"
echo $OUTPUT_FILE
