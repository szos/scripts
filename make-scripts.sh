#!/bin/sh

for file in *.in; do
    echo "${file%%.in}"
    cat include.sh > "${file%%.in}"
    cat "${file}" >> "${file%%.in}"
done 

# echo "Creating shell script $1"

# cat include.sh > "$1"

# chmod +x "$1"
