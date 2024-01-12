#!/bin/bash

# Main
function insert_citations() {
    tgt_file=$1
    bib_file=$2
  python ./.scripts/py/insert_citations.py -lt $tgt_file -lb $bib_file
}

# Check if at least two arguments are provided
if [ "$#" -lt 2 ]; then
    echo "Usage: $0 TARGET_FILE BIB_FILE"
    exit 1
fi

# Parse arguments
tgt_file="$1"
bib_file="$2"

# Call the insert_citations function with the parsed arguments
insert_citations "$tgt_file" "$bib_file"

# ./.scripts/sh/insert_citations.sh ./src/introduction.tex ./bibliography.bib


