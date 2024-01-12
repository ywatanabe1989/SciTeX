#!/bin/bash

latest_tex=$(ls -v ./old/compiled_v*.tex | tail -n 1)
current_tex="./compiled.tex"

# ./.scripts/sh/diff.sh $latest_tex $current_tex ./diff.tex
latexdiff $latest_tex $current_tex > ./diff.tex
# ./.scripts/sh/.remove_not_defined_tags.sh
echo -e "\nCompiling diff.tex..."        
yes '' | pdflatex -shell-escape ./diff.tex # > /dev/null
bibtex diff # > /dev/null
yes '' | pdflatex -shell-escape ./diff.tex # > /dev/null
yes '' | pdflatex -shell-escape ./diff.tex # > /dev/null

## EOF
