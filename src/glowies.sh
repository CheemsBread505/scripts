#!/bin/bash

# Define the URL and filename
url="https://www.cheemsbread.xyz/filelist//Videos/glowies.mp4"
filename="glowies.mp4"

# Download the video using wget
wget "$url" -O "$filename"

# Play the video with mpv
mpv "$filename"

# Remove the video file after playback
rm "$filename"

