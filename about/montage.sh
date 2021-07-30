#!/usr/bin/bash
cd icons
for old in *; do
    new="$(echo "$old" | sed -e 's/.svg$/-large.svg/')"
    echo $new
    rsvg-convert "$old" -h 1080 -f svg -o "$new"
done
cd ..
montage icons/*-large.svg -geometry 540x540 -tile 6x6 -border 30 -bordercolor white montage.png
convert montage.png -resize 25% montage.webp
gio trash icons/*-large.svg
