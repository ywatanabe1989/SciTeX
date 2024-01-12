#!/bin/bash

function print_success() {
    echo ''
    if [ -f ./.compiled.pdf ]; then
        echo "Congratulations! compiled.pdf is ready."
    else
        echo "Something went wrong. Please check the .logs/ directory"
    fi
}

print_success

## EOF
