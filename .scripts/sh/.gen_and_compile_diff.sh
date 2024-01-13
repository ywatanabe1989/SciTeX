#!/bin/bash

function gen_and_compile_diff() {
    latest_tex=$(ls -v ./old/compiled_v*.tex | tail -n 1)
    current_tex="./compiled.tex"
    cat $latest_tex # empty
    cat $current_tex # OK

    if [ -n "$latest_tex" ] && [ -n "$current_tex" ]; then
        echo -e "\nTaking diff between $latest_tex & $current_tex"
        latexdiff "$latest_tex" "$current_tex" > ./diff.tex 2> /dev/null
    fi

    if [ -s diff.tex ]; then
        echo -e "\n./diff.tex was created."
        echo -e "\nCompiling ./diff.tex..."
        yes '' | pdflatex -shell-escape ./diff.tex # >/dev/null
        bibtex diff >/dev/null 2>&1
        yes '' | pdflatex -shell-escape ./diff.tex # >/dev/null
        yes '' | pdflatex -shell-escape ./diff.tex # >/dev/null
    else
        echo -e "\ndiff.tex is empty. Skip compiling .diff.tex"
    fi

    if [ -f ./diff.pdf ]; then
        echo -e "\nCompiled: ./diff.tex"
    fi
}

gen_and_compile_diff

## EOF
