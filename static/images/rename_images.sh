#!/bin/bash
    
# This script renames all image files in the current directory
# to the format 'img<number>-wrong.<extension>', preserving their original extension.
    
# Counter for image naming
i=1
    
# Loop through all files in the current directory
# Find files, sort them naturally to ensure consistent renaming order
find . -maxdepth 1 -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.gif" -o -iname "*.svg" -o -iname "*.webp" \) | sort -V | while read -r filepath; do
    if [[ "$filepath" == "./rename_images.sh" ]]; then
        continue # Don't rename the script itself
    fi

    filename=$(basename "$filepath")
    extension="${filename##*.}"
    base_name="${filename%.*}"

    new_name="img${i}-wrong.${extension}"

    if [[ "$filename" != "$new_name" ]]; then
        echo "Renaming '$filename' to '$new_name'"
        mv "$filepath" "$(dirname "$filepath")/$new_name"
    else
        echo "File '$filename' is already named correctly."
    fi
    ((i++))
done

echo "Image renaming complete."