#!/bin/bash

function compile_main_tex() {
    echo -e "\nCompiling ./main.tex..."

    # compile tables and figures
    ./.scripts/sh/.tables.sh
    ./.scripts/sh/.figures.sh    

    # Main
    yes '' | pdflatex -shell-escape ./main.tex >/dev/null
    bibtex main 2>&1 >/dev/null | grep -E "Warning|Error"
    yes '' | pdflatex -shell-escape ./main.tex >/dev/null
    yes '' | pdflatex -shell-escape ./main.tex >/dev/null

    # Rename
    mv main.pdf compiled.pdf
}

compile_main_tex

## EOF
