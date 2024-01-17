#!/bin/bash

function compile_main_tex() {
    echo -e "\nCompiling ./main.tex..."

    # compile tables and figures
    ./.scripts/sh/.tables.sh 
    ./.scripts/sh/.figures.sh $no_figs

    # Main
    yes '' | pdflatex -shell-escape ./main.tex >/dev/null # this wil problematic sometimes
    bibtex main 2>&1 >/dev/null | grep -E "Warning|Error"
    yes '' | pdflatex -shell-escape ./main.tex >/dev/null
    yes '' | pdflatex -shell-escape ./main.tex >/dev/null

    # Rename
    mv main.pdf compiled.pdf
}

no_figs=${1:-default_value}
compile_main_tex

# ./.scripts/sh/.compile_main.tex.sh --no-figs

## EOF
