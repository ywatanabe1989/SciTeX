#!/bin/bash

do_take_diff=true
do_insert_citations=false
do_revise=false
while [[ "$#" -gt 0 ]]; do
    case $1 in
        -h|--help) echo "Usage: $0 [--no-take-diff] [--insert-citations] [--revise]"; exit 0 ;;
        --no-take-diff) do_take_diff=false ;;
        --insert-citations) do_insert_citations=true ;;
        --revise) do_revise=true ;;        
        # *) echo "Unknown parameter passed: $1"; exit 1 ;;
    esac
    shift
done

source ./.scripts/sh/.check_commands.sh
source ./.scripts/sh/.cleanup.sh
source ./.scripts/sh/.compile_tex_and_bib.sh
source ./.scripts/sh/.gen_the_compiled_tex_file.sh
source ./.scripts/sh/.figures.sh
source ./.scripts/sh/.tables.sh
source ./.scripts/sh/.pdf.sh
source ./.scripts/sh/.print_success.sh
source ./.scripts/sh/.store_old_versions.sh
source ./.scripts/sh/.load_files_list.sh 

# Checks
check_commands pdflatex bibtex xlsx2csv csv2latex
chktex -v0 ./main.tex > ./.logs/syntax_warnings.log 2>&1

# Format ./main.tex file
latexindent -w ./main.tex > /dev/null 2>&1

# Store old pdf files
store_old

# Revise tex files if requested (default: false)
if [ "$do_revise" = true ]; then
    echo -e "\nRevising..."    
    ./.scripts/sh/revise.sh
fi
    
# Insert citations if requested (default: false)
if [ "$do_insert_citations" = true ]; then
    echo -e "\nInserting citations..."
    ./.scripts/sh/insert_citations.sh
fi

# Main
compile_tex_and_bib
gen_the_compiled_tex_file

# Take diff if requested (default: true)
if [ "$do_take_diff" = true ]; then
    echo -e "\nTaking diff..."    
    latest_tex=$(ls -v ./old/compiled_v*.tex | tail -n 1)
    current_tex="./compiled.tex"
    ./.scripts/sh/diff.sh $latest_tex $current_tex ./diff.tex    
    ./.scripts/sh/.remove_not_defined_tags.sh
    echo -e "\nCompiling diff.tex..."        
    yes '' | pdflatex -shell-escape ./diff.tex > /dev/null
    bibtex diff > /dev/null
    yes '' | pdflatex -shell-escape ./diff.tex > /dev/null
    yes '' | pdflatex -shell-escape ./diff.tex > /dev/null
fi

# Success message
print_success

# Move unnecessary files
mv_unnecessary_files

# Open the compiled pdf
if [ "$(echo $USER)" = "ywatanabe" ]; then
    echo "compiled.pdf"
    if [ "$do_take_diff" = false ]; then    
    open_pdf_or_exit ./compiled.pdf
    else
    # if [ "$do_take_diff" = true ]; then
        echo "diff.pdf"
    fi
    open_pdf_or_exit ./diff.pdf    
fi

# # # Tree
# # tree > ./.tree.txt

## EOF
