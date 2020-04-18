#!/bin/sh
now=`date +"%Y-%m-%d-%H%M"`
/scan -d -r 300 -v -m Lineart --skip-empty-pages -o /out/scan-$now.pdf
