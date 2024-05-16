#!/bin/bash

# Define the WebP compressor
COMPRESSOR="cwebp"
# URL to download the WebP compressor
COMPRESSOR_DOWNLOAD_URL="https://developers.google.com/speed/webp/docs/precompiled"
# Define the default compression quality
COMPRESSION_QUALITY="90"
# Define the counter for the number of images converted
COUNTER=0

# Check if the WebP compressor is installed
if ! command -v $COMPRESSOR &>/dev/null; then
  # Check the OS type to provide the correct installation instructions
  if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    echo "ERROR: The CLI tool \"$COMPRESSOR\" is not installed. Install it with \`sudo apt-get install webp\` or download it from $COMPRESSOR_DOWNLOAD_URL"

  # Check if the OS is macOS
  elif [[ "$OSTYPE" == "darwin"* ]]; then
    echo "ERROR: The CLI tool \"$COMPRESSOR\" is not installed. Install it with \`brew install webp\` or download it from $COMPRESSOR_DOWNLOAD_URL"

  # Check if the OS is Windows
  elif [[ "$OSTYPE" == "msys" || "$OSTYPE" == "cygwin" ]]; then
    echo "ERROR: The CLI tool \"$COMPRESSOR\" is not installed. Download it from $COMPRESSOR_DOWNLOAD_URL"

  # Check if the OS is FreeBSD
  elif [[ "$OSTYPE" == "freebsd"* ]]; then
    echo "ERROR: The CLI tool \"$COMPRESSOR\" is not installed. Install it with \`pkg install webp\` or download it from $COMPRESSOR_DOWNLOAD_URL"

  # Check for other OS types
  else
    # Provide a generic error message
    echo "ERROR: The CLI tool \"$COMPRESSOR\" is not installed. Download it from $COMPRESSOR_DOWNLOAD_URL"
  fi

  # Exit the script
  exit 1
fi

# Check if the user provided the quality argument and revert to default if not
if [[ -n "$1" ]]; then
  # Set the compression quality to the user-provided value
  COMPRESSION_QUALITY="$1"
fi

# Check if the user provided the help argument and show the help message
if [[ $1 == "-h" || $1 == "--help" ]]; then
  # Get the base name of the script
  BASENAME=$(basename "$0")

  # Show the help message
  echo "USAGE: $BASENAME <quality>"

  # Exit the script
  exit 0
fi

# Loop through all the images in the current directory and convert them to WebP
for file in *.{jpg,jpeg,png}; do
  # Check if the file exists and skip to the next one if it doesn't
  [ -e "$file" ] || continue

  COUNTER=$((COUNTER + 1))

  # Convert the image to WebP format (in quiet mode) and remove the original file
  cwebp -quiet -q "$COMPRESSION_QUALITY" "$file" -o "${file%.*}.webp" && rm "$file"
done

echo "Converted $COUNTER images to WebP format with a quality of $COMPRESSION_QUALITY"

# Exit the script successfully
exit 0
