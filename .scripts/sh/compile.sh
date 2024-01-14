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
    do_term_check=false
    do_p2t=false
    do_yes=false    

    # Function to display help message
    usage() {
        echo "Usage: $0 [options]"
        echo "Options:"
        echo "  -p,  --push          Enables push action"
        echo "  -r,  --revise        Enables revision process with GPT"
        echo "  -t,  --terms         Enables term checking with GPT"
        echo "  -p2t, --ppt2tif      Converts Power Point to TIF (on WSL on Windows)"
        echo "  -c,  --citations     Inserts citations with GPT"
        echo "  -nd, --no-diff       Disables taking differences with the original manuscript"
        echo "  -y, --yes            Accepts all processes answering yes"
        exit 0
    }

    while [[ "$#" -gt 0 ]]; do
        case $1 in
            -h|--help) usage ;;
            -p|--push) do_push=true ;;
            -r|--revise) do_revise=true ;;
            -t|--terms) do_term_check=true ;;
            -p2t|--ppt2tif) do_p2t=true ;;
            -c|--citations) do_insert_citations=true ;;
            -y|--yes) do_yes=true ;;            
            -nd|--no-diff) do_take_diff=false ;;
            # *) echo "Unknown parameter passed: $1"; exit 1 ;;
        esac
        shift
    done

    # for logging
    echo "./compile.sh" \
         $(if [ "$do_push" = true ]; then echo "--push "; fi) \
         $(if [ "$do_revise" = true ]; then echo "--revise "; fi) \
         $(if [ "$do_term_check" = true ]; then echo "--terms "; fi) \
         $(if [ "$do_p2t" = true ]; then echo "--ppt2tif "; fi) \
         $(if [ "$do_insert_citations" = true ]; then echo "--citations "; fi) \
         $(if [ "$do_take_diff" != true ]; then echo "--no-diff "; fi) \
         $(if [ "$do_yes" != true ]; then echo "--yes "; fi)
    echo
    

    say_yes() {
        if [ "$do_yes" = true ]; then
            yes | "$@"
        else
            "$@"
        fi
    }
    
    # Checks
    ./.scripts/sh/.check.sh

    
    # PowerPoint to Tiff (default: false)
    if [ "$do_p2t" = true ]; then
        say_yes ./.scripts/sh/.pptx2tif_all.sh
        # ./.scripts/sh/.pptx2tif_all.sh
    fi

    # Crop figures
    ./.scripts/sh/.crop_figures.sh

    # Revise tex files if requested (default: false)
    if [ "$do_revise" = true ]; then
        say_yes ./.scripts/sh/revise.sh
    fi
    
    # Insert citations if requested (default: false)
    if [ "$do_insert_citations" = true ]; then
        say_yes ./.scripts/sh/insert_citations.sh
    fi

    # Word count
    ./.scripts/sh/.count_words_figures_and_tables.sh

    # Main
    ./.scripts/sh/.compile_main.tex.sh # -> compiled.pdf, collect figures and tables
    ./.scripts/sh/.gen_compiled.tex.sh # -> compiled.tex

    # Take diff if requested (default: false)
    if [ "$do__diff" = true ]; then
        ./.scripts/sh/.gen_and_compile_diff.sh
    fi

    # Move unnecessary files
    ./.scripts/sh/.cleanup.sh

    # Store compiled files
    ./.scripts/sh/.versioning.sh

    # Success message
    ./.scripts/sh/.print_success.sh

    # Check terms
    if [ "$do_term_check" = true ]; then
        say_yes ./.scripts/sh/.check_terms.sh 
    fi

    # Tree
    ./.scripts/sh/.custom_tree.sh

    echo -e "\nLog saved to $LOG_FILE\n"

    if [ "$do_push" = true ]; then
        ./.scripts/sh/.git_push.sh
    fi

} 2>&1 | tee "$LOG_FILE"



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

## EOF
