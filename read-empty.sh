#! /bin/bash
# TODO: Find a way to do it in only one call to find
read -r -p "Enter path to directory: " line

printf "\n%-50s %-50s\n" "Empty directory" "Time created"
find "$line" -type d -empty -exec stat -c "%-50n %-50w" {} \;

echo ""
empty_dir_count=$(find "$line" -type d -empty | wc -l)
echo "Empty directory count: $empty_dir_count"
