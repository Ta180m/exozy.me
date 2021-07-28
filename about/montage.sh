cd icons
for old in *; do
    new="$(echo "$old" | sed -e 's/.svg$/-large.svg/')"
    echo $new
    rsvg-convert "$old" -h 1080 -f svg -o "$new"
done
cd ..
montage icons/*-large.svg -geometry 540x540 -tile 8x4 -border 20 -bordercolor white montage.png
gio trash icons/*-large.svg
