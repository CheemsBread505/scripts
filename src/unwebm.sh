#!/bin/bash

# Check if FFmpeg is installed
if ! command -v ffmpeg &>/dev/null; then
  echo "FFmpeg is not installed. Please install FFmpeg before running this script."
  exit 1
fi

# Check if the input file is provided as an argument
if [ $# -ne 2 ]; then
  echo "Usage: $0 <input_webm_file> <--mp4 or --mov>"
  exit 1
fi

# Input file name provided as an argument
input_webm="$1"

# Check if the input file exists
if [ ! -f "$input_webm" ]; then
  echo "Input file '$input_webm' not found."
  exit 1
fi

# Output file extension specified as a flag
output_extension=""
case "$2" in
  "--mp4")
    output_extension=".mp4"
    ;;
  "--mov")
    output_extension=".mov"
    ;;
  *)
    echo "Invalid flag. Supported flags are: --mp4 or --mov."
    exit 1
    ;;
esac

# Output file name
output_file="${input_webm%.*}$output_extension"

# Convert WebM to either MP4 or MOV using FFmpeg
ffmpeg -i "$input_webm" "$output_file"

echo "Conversion complete. Output file saved as '$output_file'."

