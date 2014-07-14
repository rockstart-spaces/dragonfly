#!/bin/sh

# $1 input filename
# $2 output filename
# $3 time in seconds

avconv -i $1 -vcodec copy -acodec copy -t $3 $2