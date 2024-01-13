#!/bin/bash

function print_success() {
    declare -a files_to_check=("compiled_v*.pdf" "diff_v*.pdf")

    for pattern in "${files_to_check[@]}"; do
        files_found=$(ls ./${pattern} 2> /dev/null)
        if [ -n "$files_found" ]; then
            for file in $files_found; do
                echo -e "\nCongratulations! ${file} is ready."
            done
        else
            echo -e "\nI'm sorry but files matching ${pattern} were not created. Please check the .logs/ directory"
        fi
    done
}

print_success

## EOF
