#!/bin/bash

# Include external function files
source ./.scripts/sh/.check_commands.sh
source ./.scripts/sh/.cleanup.sh
source ./.scripts/sh/.compile_tex_and_bib.sh
source ./.scripts/sh/.combine_tex_files.sh
source ./.scripts/sh/.figures.sh
source ./.scripts/sh/.tables.sh
source ./.scripts/sh/.pdf.sh
source ./.scripts/sh/.print_success.sh
source ./.scripts/sh/.store_old_versions.sh 

# Checks commands
check_commands pdflatex bibtex xlsx2csv csv2latex

# Check the syntax of ./main.tex file
chktex -v0 ./main.tex > ./.logs/syntax_warnings.log 2>&1

# Format ./main.tex file
latexindent -w ./main.tex > /dev/null 2>&1

# Store old pdf files
store_old

# Main
compile_tex_and_bib

# Success message
print_success

# Move unnecessary files
mv_unnecessary_files

# Open the compiled pdf
if [ "$(echo $USER)" = "ywatanabe" ]; then
    open_pdf_or_exit ./main.pdf
fi

# # Tree
# tree > ./.tree.txt

## EOF
