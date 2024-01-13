#!/bin/bash

LOG_FILE="./compile.log"

{
echo -e "\nLog file created: "$LOG_FILE

rm ./.compiled.tex > /dev/null 2>&1
rm ./.compiled.pdf > /dev/null 2>&1
rm ./.diff.tex > /dev/null 2>&1

do_take_diff=true
do_insert_citations=false
do_revise=false
while [[ "$#" -gt 0 ]]; do
    case $1 in
        -h|--help) echo "Usage: $0 [-nd|--no-diff] [-c|--citations] [-r|--revise]"; exit 0 ;;
        -nd|--no-diff) do_take_diff=false ;;
        -c|--citations) do_insert_citations=true ;;
        -r|--revise) do_revise=true ;;
        # *) echo "Unknown parameter passed: $1"; exit 1 ;;
    esac
    shift
done

# source ./.scripts/sh/.cleanup.sh
# source ./.scripts/sh/.figures.sh
# source ./.scripts/sh/.tables.sh
# source ./.scripts/sh/.pdf.sh
# source ./.scripts/sh/.store_compiled.sh
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
./.scripts/sh/.compile_main.tex.sh # compiled.pdf
./.scripts/sh/.gen_compiled.tex.sh # compiled.tex

# Take diff if requested (default: false)
if [ "$do_take_diff" = true ]; then
    ./.scripts/sh/.gen_and_compile_diff.sh
fi

# Move unnecessary files
./.scripts/sh/.cleanup.sh

# Store compiled files
./.scripts/sh/.versioning.sh

# Success message
./.scripts/sh/.print_success.sh



# # Format tex files
# find . -name "*.tex" -type f -print0 | xargs -0 -I {} latexindent -w "{}"  > /dev/null 2>&1

# # Open the compiled pdf
# if [ "$(echo $USER)" = "ywatanabe" ]; then
#     # open_pdf_or_exit ./compiled.pdf    
#     if [ "$do_take_diff" = false ]; then
#         PDF_PATH=./.compiled.pdf
#     else
#         PDF_PATH=./.diff.pdf        
#     fi
#     ./.scripts/sh/.open_pdf_or_exit.sh $PDF_PATH
# fi

} 2>&1 | tee "$LOG_FILE"

## EOF
