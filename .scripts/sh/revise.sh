#!/bin/bash

function revise() {
  echo -e "\nBased on ./configs/files_to_revise.txt, the following texfiles are being revised:\n"
  echo -e "${files_to_revise// /\\n}"
  echo
  read -p "Is it okay to proceed? (y/n) " -n 1 -r
  echo
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    if [[ -n $files_to_revise ]]; then # [REVISED]      
        echo $files_to_revise | xargs -n 1 -P 5 .env/bin/python ./.scripts/py/revise_by_GPT.py -l
    fi
  fi
}

source ./.scripts/sh/.load_files_list.sh

# Load from the config file
config_file_path="./configs/files_to_revise.txt"
files_to_revise=$(load_files_list "$config_file_path")

# Main
revise $files_to_revise

# ./.scripts/sh/revise.sh
