#!/bin/bash

function check_commands() {
    for COMMAND in "$@"; do  # [REVISED]
        if ! command -v $COMMAND &> /dev/null; then
            echo "${COMMAND} could not be found. Please install the necessary package. (e.g., sudo apt-get install ${COMMAND} -y)"
            exit 1
        fi
    done
}

check_commands pdflatex bibtex xlsx2csv csv2latex
chktex -v0 ./main.tex > ./.logs/syntax_warnings.log 2>&1

## EOF
