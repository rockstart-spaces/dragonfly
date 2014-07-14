#!/bin/sh

# $1 input file (anything)
# $2 output file (.avi)

avconv -i $1 -vcodec mpeg4 -qscale 8 -r 30 -acodec copy $2
