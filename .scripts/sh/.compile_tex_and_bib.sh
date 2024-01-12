#!/bin/bash

function compile_tex_and_bib() {
    echo -e "\nCompiling ./main.tex and generating ./compiled.pdf..."

    # compile tables and figures
    # gather_tables
    # gather_figures
    ./.scripts/sh/.tables.sh
    ./.scripts/sh/.figures.sh    

    # Main
    yes '' | pdflatex -shell-escape ./main.tex #> /dev/null
    bibtex main > /dev/null
    yes '' | pdflatex -shell-escape ./main.tex # > /dev/null
    yes '' | pdflatex -shell-escape ./main.tex # > /dev/null

    # Rename
    mv main.pdf compiled.pdf
}

compile_tex_and_bib

## EOF
