#!/bin/bash

# Main
function diff() {
    file_1=$1
    file_2=$2
    spath=$3  # This is the optional third argument
    
    ./env/bin/python ./.scripts/py/diff.py --lpath_1 $file_1 --lpath_2 $file_2 --spath $spath
}

# Parse arguments
file_1=${1:-""}
file_2=${2:-""}
spath=${3:-""}

# Call the insert_citations function with the parsed arguments
diff "$file_1" "$file_2" "$spath"

# ./.scripts/sh/diff.sh ./src/introduction.tex ./src/introduction_cited.tex
