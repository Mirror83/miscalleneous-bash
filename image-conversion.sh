#! /bin/bash
read -r -p "Enter path to directory: " line

if ! test -d "$line"; then
    echo "$line is not a directory"
    exit 1
fi

read -r -p "Enter path to output directory: " output_dir

if ! test -d "$output_dir"; then
    echo "Directory does not exist. Creating output directory $output_dir"
    
    if mkdir "$output_dir"; then 
        echo "Directory created."
    fi
fi

bmp_files=$(find "$line" -name "*.bmp")
convert_count=0

for file in $bmp_files; do
    filename=$(basename "$file")
    filename_without_ext=${filename%.*}

    convert "$file" "$filename_without_ext.jpeg"
    mv "$filename_without_ext.jpeg" "$output_dir"

    ((convert_count++))
done

echo "Number of images converted: $convert_count"
