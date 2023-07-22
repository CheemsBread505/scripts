#!/bin/bash

# Check if the 'convert' command from ImageMagick is available
if ! command -v convert >/dev/null; then
  echo "ImageMagick package is not installed. Please install it before running this script."
  exit 1
fi

# Check if a directory path was provided as an argument
if [ -z "$1" ]; then
  echo "Usage: $0 <directory>"
  exit 1
fi

# Get the directory path from the command-line argument
source_dir="$1"

# Check if the source directory exists
if [ ! -d "$source_dir" ]; then
  echo "Directory '$source_dir' does not exist."
  exit 1
fi

# Convert each .webp file to .png and remove the .webp file
for file in "$source_dir"/*.webp; do
  if [ -f "$file" ]; then
    # Get the base filename without extension
    base_filename=$(basename "$file" .webp)

    # Convert .webp to .png using ImageMagick's convert command
    convert "$file" "$source_dir/$base_filename.png"

    echo "Converted: $file"

    # Remove the .webp file
    rm "$file"

    echo "Removed: $file"
  fi
done

echo "Conversion and removal complete!"
