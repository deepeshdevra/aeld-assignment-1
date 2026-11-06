#!/bin/sh
# Writer script for assignment 1 and assignment 2
# Author: Siddhant Jajoo

# Exit immediately if a command exits with a non-zero status
set -e
set -u

# Check if both arguments are provided
if [ $# -lt 2 ]
then
    echo "Error: Parameters not specified. Usage: $0 <writefile> <writestr>"
    exit 1
fi

writefile=$1
writestr=$2

# Extract the directory path from the writefile path
writedir=$(dirname "$writefile")

# Create the directory path if it doesn't exist
if [ ! -d "$writedir" ]
then
    mkdir -p "$writedir"
    if [ $? -ne 0 ]
    then
        echo "Error: Could not create directory path '$writedir'"
        exit 1
    fi
fi

# Create the new file with writestr, overwriting any existing file
echo "$writestr" > "$writefile"

# Verify if the file was created successfully
if [ ! -f "$writefile" ]
then
    echo "Error: Could not create file '$writefile'"
    exit 1
fi

exit 0
