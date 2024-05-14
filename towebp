#!/bin/bash

# Check if argument is provided
if [ -z "$1" ]; then
    echo "Usage: $0 <quality>"
    exit 1
fi

# Convert non-WebP images to WebP format with specified quality
for file in *.{jpg,jpeg,png}; do
    [ -e "$file" ] || continue
    cwebp -q "$1" "$file" -o "${file%.*}.webp" && rm "$file"
done

