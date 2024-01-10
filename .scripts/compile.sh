#!/bin/bash

# Include external function files
source ./.scripts/_check_commands.sh
source ./.scripts/_cleanup.sh
source ./.scripts/_compile_tex_and_bib.sh
source ./.scripts/_combine_tex_files.sh
source ./.scripts/_figures.sh
source ./.scripts/_tables.sh
source ./.scripts/_pdf.sh
source ./.scripts/_print_success.sh
source ./.scripts/_store_old_versions.sh 

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

# Tree
tree > ./.tree.txt

## EOF
