#!/bin/sh
#
# Download an entire website:
# ./download-website.sh domain url
wget \
     --recursive \
     --no-clobber \
     --page-requisites \
     --html-extension \
     --convert-links \
     --restrict-file-names=unix \
     --domains $1 \
     --no-parent \
         $2

