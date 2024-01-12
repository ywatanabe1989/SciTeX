#!/bin/bash

# Main
function diff() {
    file_1=$1
    file_2=$2
    spath=$3  # This is the optional third argument    
    
  python ./.scripts/py/diff.py $file_1 $file_2 $spath
}

# Check if at least two arguments are provided
if [ "$#" -lt 2 ]; then
    echo "Usage: $0 TGT_TEX_FILE BIB_FILE"
    exit 1
fi

# Parse arguments
file_1="$1"
file_2="$2"
spath=${3:-""}

# Call the insert_citations function with the parsed arguments
diff "$file_1" "$file_2"

# ./.scripts/sh/diff.sh ./src/introduction.tex ./src/introduction_cited.tex
