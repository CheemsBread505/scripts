#!/bin/bash

# Define the source directory and target directory
src_dir="src/"
target_dir="/usr/bin"

# Look for files in src/ that end with '.sh'
files_to_remove=$(find "$src_dir" -type f -name "*.sh")

# Check if there are any matching files in src/
if [[ -z "$files_to_remove" ]]; then
    echo "No matching files found in $src_dir"
    exit 0
fi

# Loop through the matching files and remove them from /usr/bin
for file in $files_to_remove; do
    file_name=$(basename "$file")
    target_file="$target_dir/$file_name"
    
    if [[ -f "$target_file" ]]; then
        rm -i "$target_file"
        echo "Removed $file_name from $target_dir"
    else
        echo "$file_name not found in $target_dir"
    fi
done

