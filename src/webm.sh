#!/bin/bash

# Check if FFmpeg is installed
if ! command -v ffmpeg &>/dev/null; then
  echo "FFmpeg is not installed. Please install FFmpeg before running this script."
  exit 1
fi

# Check if the input file is provided as an argument
if [ $# -ne 1 ]; then
  echo "Usage: $0 <input_file>"
  exit 1
fi

# Input file name/path provided as an argument
input_file="$1"

# Check if the input file exists
if [ ! -f "$input_file" ]; then
  echo "Input file '$input_file' not found."
  exit 1
fi

# Output file name
output_file="${input_file%.*}.webm"

# Convert MP4 to WebM using FFmpeg
ffmpeg -i "$input_file" -c:v libvpx -c:a libvorbis "$output_file"

echo "Conversion complete. WebM file saved as '$output_file'."

