#!/bin/bash

# Define the WebP compressor
COMPRESSOR="cwebp"
# URL to download the WebP compressor
COMPRESSOR_DOWNLOAD_URL="https://developers.google.com/speed/webp/docs/precompiled"
# Define the default compression quality
COMPRESSION_QUALITY="90"
# Define the counter for the number of images converted
COUNTER=0
# Log file for debugging and records
LOG_FILE="TOWEBP.log"

# Function to check and install cwebp
install_compressor() {
    echo "Attempting to install $COMPRESSOR..."
    if [[ "$OSTYPE" == "linux-gnu"* ]]; then
        if command -v apt-get &>/dev/null; then
            sudo apt-get install -y webp
        elif command -v pacman &>/dev/null; then
            sudo pacman -S --noconfirm webp
        else
            echo "ERROR: Unsupported package manager. Please install $COMPRESSOR manually from $COMPRESSOR_DOWNLOAD_URL"
            exit 1
        fi
    elif [[ "$OSTYPE" == "darwin"* ]]; then
        brew install webp
    elif [[ "$OSTYPE" == "msys" || "$OSTYPE" == "cygwin" ]]; then
        echo "Please download and install $COMPRESSOR from $COMPRESSOR_DOWNLOAD_URL"
        exit 1
    elif [[ "$OSTYPE" == "freebsd"* ]]; then
        sudo pkg install -y webp
    else
        echo "ERROR: Unsupported OS. Please install $COMPRESSOR manually from $COMPRESSOR_DOWNLOAD_URL"
        exit 1
    fi
}

# Check if the WebP compressor is installed
if ! command -v $COMPRESSOR &>/dev/null; then
    echo "ERROR: The CLI tool \"$COMPRESSOR\" is not installed."
    read -p "Would you like to install it now? (y/N) " install_choice
    if [[ "$install_choice" =~ ^[Yy]$ ]]; then
        install_compressor
    else
        echo "Please install $COMPRESSOR and rerun the script."
        exit 1
    fi
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
  echo "USAGE: $BASENAME [quality] [--log-file]"
  echo "Options:"
  echo "  quality       Compression quality (default: 90)"
  echo "  --log-file    Log file for output (default: TOWEBP.log)"

  # Exit the script
  exit 0
fi

# Ask for confirmation before removing original files
read -p "Do you want to remove the original files after conversion? (y/N) " remove_choice
REMOVE_ORIGINALS=false
if [[ "$remove_choice" =~ ^[Yy]$ ]]; then
    REMOVE_ORIGINALS=true
fi

# Log the start time
echo "Conversion started at $(date)" >> "$LOG_FILE"

# Loop through all the images in the current directory and convert them to WebP
find . -maxdepth 1 -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" \) | while read -r file; do
  COUNTER=$((COUNTER + 1))
  # Convert the image to WebP format (in quiet mode) and remove the original file if opted
  if cwebp -quiet -q "$COMPRESSION_QUALITY" "$file" -o "${file%.*}.webp"; then
    echo "Converted $file to ${file%.*}.webp" >> "$LOG_FILE"
    if [ "$REMOVE_ORIGINALS" = true ]; then
      rm "$file"
      echo "Removed original file $file" >> "$LOG_FILE"
    fi
  else
    echo "Failed to convert $file" >> "$LOG_FILE"
  fi
done

# Output the results
echo "Converted $COUNTER images to WebP format with a quality of $COMPRESSION_QUALITY"
echo "Conversion completed at $(date)" >> "$LOG_FILE"

# Exit the script successfully
exit 0

