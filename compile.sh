#!/bin/bash

# Include external function files
source ./scripts/checks.sh
source ./scripts/figures.sh
source ./scripts/tables.sh
source ./scripts/compile.sh
source ./scripts/cleanup.sh
source ./scripts/pdf.sh

# Checks commands
check_commands pdflatex bibtex xlsx2csv csv2latex

# Check the syntax of ./main.tex file
chktex -v0 ./main.tex > syntax_warnings.log 2>&1

# Format ./main.tex file
latexindent -w ./main.tex > /dev/null 2>&1

# Store old pdf files
store_old_pdf

# Main
compile

# Success message
print_success

# Move unnecessary files
mv_unnecessary_files

# Open the compiled pdf
if [ "$(echo $USER)" = "ywatanabe" ]; then
    open_pdf_or_exit ./build/main.pdf
fi

# Tree
tree > ./tree.txt

## EOF
