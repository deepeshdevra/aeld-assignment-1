#!/bin/sh
# Finder script for assignment 1 and assignment 2
# Author: Siddhant Jajoo

# Exit immediately if a command exits with a non-zero status
set -e
set -u

# Check if both arguments are provided
if [ $# -lt 2 ]
then
    echo "Error: Parameters not specified. Usage: $0 <filesdir> <searchstr>"
    exit 1
fi

filesdir=$1
searchstr=$2

# Check if filesdir represents a directory on the filesystem
if [ ! -d "$filesdir" ]
then
    echo "Error: Directory '$filesdir' does not exist or is not a directory."
    exit 1
fi

# Count the number of files in the directory and all subdirectories
# -type f finds files, and wc -l counts the number of lines (files)
X=$(find "$filesdir" -type f | wc -l)

# Count the number of matching lines containing searchstr across all files
# grep -r searches recursively, -o outputs only the matching parts (or we can count matching lines), 
# using grep -r -s to suppress errors for unreadable files, or a safer pipeline:
# Alternatively, grep -rn returns lines. Let's use grep to count lines containing searchstr.
# We use standard grep -r with string matching:
Y=$(grep -r "$searchstr" "$filesdir" 2>/dev/null | wc -l)

# Print the required output format
echo "The number of files are $X and the number of matching lines are $Y"

exit 0
