#!/bin/bash

function gen_and_compile_diff() {
    latest_tex=$(ls -v ./old/compiled_v*.tex | tail -n 1)
    current_tex="./compiled.tex"

    latexdiff "$latest_tex" "$current_tex" > ./diff.tex 2> /dev/null    

    echo -e "\nCompiling ./diff.tex..."
    yes '' | pdflatex -shell-escape ./diff.tex >/dev/null
    bibtex diff 2>&1 >/dev/null | grep -E "Warning|Error"
    yes '' | pdflatex -shell-escape ./diff.tex >/dev/null
    yes '' | pdflatex -shell-escape ./diff.tex >/dev/null

    if [ -f ./diff.tex ]; then
        echo -e "\nCompiled: ./diff.tex"
    fi
}

gen_and_compile_diff

## EOF
