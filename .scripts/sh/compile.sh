#!/bin/bash

LOG_FILE="./.logs/compile.log"

{
rm ./.compiled.tex > /dev/null 2>&1
rm ./.compiled.pdf > /dev/null 2>&1
rm ./.diff.tex > /dev/null 2>&1

do_take_diff=true
do_insert_citations=false
do_revise=false
do_push=false
while [[ "$#" -gt 0 ]]; do
    case $1 in
        -h|--help) echo "Usage: $0 [-nd|--no-diff] [-c|--citations] [-r|--revise] [-p|--push]"; exit 0 ;;
        -nd|--no-diff) do_take_diff=false ;;
        -c|--citations) do_insert_citations=true ;;
        -r|--revise) do_revise=true ;;
        -p|--push) do_push=true ;;        
        # *) echo "Unknown parameter passed: $1"; exit 1 ;;
    esac
    shift
done

# for logging
echo ./compile.sh $(if ! $do_take_diff; then echo "--no-diff"; fi) $(if $do_insert_citations; then echo "--citations"; fi) $(if $do_revise; then echo "--revise"; fi) $(if $do_push; then echo "--push"; fi)
echo

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

# Word count
./.scripts/sh/.count_words_figures_and_tables.sh

# Main
./.scripts/sh/.gen_compiled.tex.sh # -> compiled.tex
./.scripts/sh/.compile_main.tex.sh # -> compiled.pdf

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

# Tree
./.scripts/sh/.custom_tree.sh

echo -e "\nLog saved to $LOG_FILE\n"

if [ "$do_push" = true ]; then
    ./.scripts/sh/.git_push.sh
fi

} 2>&1 | tee "$LOG_FILE"


## EOF

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
