#! /bin/bash
# TODO: Find a way to do it in only one call to find
read -r -p "Enter path to directory: " line

printf "\n%-50s %-50s\n" "Empty directory" "Time created"

# The command passed in for the exec option executes the command
# (in this case stat) foreach match it, well, finds.
# The stat command gives the name and time of file birth for the file
# (due to the %n and %w in its -c(format) argument)
find "$line" -type d -empty -exec stat -c "%-50n %-50w" {} \;

echo ""
empty_dir_count=$(find "$line" -type d -empty | wc -l)
echo "Empty directory count: $empty_dir_count"
