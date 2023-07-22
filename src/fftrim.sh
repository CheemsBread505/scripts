#!/bin/bash

# Check if FFmpeg is installed
if ! command -v ffmpeg &> /dev/null; then
    echo "FFmpeg is not installed. Please install FFmpeg to use this script."
    exit 1
fi

# Check if the input file is provided
if [ $# -lt 2 ]; then
    echo "Usage: $0 input_video.mp4 -ss 00:00:08"
    exit 1
fi

# Get the input filename and extension
input_file="$1"
filename=$(basename -- "$input_file")
extension="${filename##*.}"

# Get the start time for trimming
start_time="$2"

# Generate the output filename with "trim_" before the original filename
output_file="trim_${filename%.*}.${extension}"

# Trim the video using FFmpeg
ffmpeg -i "$input_file" -ss "$start_time" -c copy "$output_file"

echo "Trimmed video saved as: $output_file"

