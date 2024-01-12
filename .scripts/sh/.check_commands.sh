#!/bin/bash

function check_commands() {
    for COMMAND in "$@"; do  # [REVISED]
        if ! command -v $COMMAND &> /dev/null; then
            echo "${COMMAND} could not be found. Please install the necessary package. (e.g., sudo apt-get install ${COMMAND} -y)"
            exit 1
        fi
    done
}

## EOF
