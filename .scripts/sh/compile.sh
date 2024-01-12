#!/bin/bash

LOG_FILE="./compile.log"

{
echo "Log file created: "$LOG_FILE

rm ./.compiled.tex > /dev/null 2>&1
rm ./.compiled.pdf > /dev/null 2>&1
rm ./.diff.tex > /dev/null 2>&1

do_take_diff=false
do_insert_citations=false
do_revise=false
while [[ "$#" -gt 0 ]]; do
    case $1 in
        -h|--help) echo "Usage: $0 [-d|--diff] [-i|--insert-citation] [-r|--revise]"; exit 0 ;;
        -d|--diff) do_take_diff=true ;;
        -i|--insert-citations) do_insert_citations=true ;;
        -r|--revise) do_revise=true ;;
        # *) echo "Unknown parameter passed: $1"; exit 1 ;;
    esac
    shift
done

source ./.scripts/sh/.cleanup.sh
# source ./.scripts/sh/.figures.sh
# source ./.scripts/sh/.tables.sh
source ./.scripts/sh/.pdf.sh
source ./.scripts/sh/.store_compiled.sh
source ./.scripts/sh/.load_files_list.sh 

# Checks
./.scripts/sh/.check.sh

# Revise tex files if requested (default: false)
if [ "$do_revise" = true ]; then
    ./.scripts/sh/revise.sh
fi
    
# Insert citations if requested (default: false)
if [ "$do_insert_citations" = true ]; then
    ./.scripts/sh/insert_citations.sh
fi

# Main
./.scripts/sh/.compile_tex_and_bib.sh
./.scripts/sh/.gen_compiled.tex.sh

# Take diff if requested (default: false)
if [ "$do_take_diff" = true ]; then
    echo -e "\nTaking diff..."
    ./.scripts/sh/.compile_diff.sh
fi

# Success message
./.scripts/sh/.print_success.sh


# # Move unnecessary files
# mv_unnecessary_files

# # Store compiled files
# store_compiled

# # Format tex files
# find . -name "*.tex" -type f -print0 | xargs -0 -I {} latexindent -w "{}"  > /dev/null 2>&1

# Open the compiled pdf
if [ "$(echo $USER)" = "ywatanabe" ]; then
    open_pdf_or_exit ./compiled.pdf    
    # if [ "$do_take_diff" = false ]; then
    #     echo "compiled.pdf"        
    #     open_pdf_or_exit ./compiled.pdf
    # else
    #     echo "diff.pdf"
    #     open_pdf_or_exit ./diff.pdf    
    # fi
fi

} 2>&1 | tee "$LOG_FILE"
# # # Tree
# # tree > ./.tree.txt

## EOF
