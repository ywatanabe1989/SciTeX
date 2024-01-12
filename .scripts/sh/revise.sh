#!/bin/bash

# Files to revise
tex_files=""
texfiles+=" ./src/abstract.tex"
# texfiles+=" ./src/graphical_abstract.tex"
texfiles+=" ./src/introduction.tex"
texfiles+=" ./src/methods.tex"
texfiles+=" ./src/results.tex"
texfiles+=" ./src/discussion.tex"
texfiles+=" ./src/figures/*tex" # Figure legends
texfiles+=" ./src/tables/*tex" # Table legends


# Main
function revise() {
  # local texfiles=$1
  echo -e "The following texfiles will be revised:\n$(echo $texfiles | tr ' ' '\n')\n"
  read -p "Is it okay to proceed? (y/n) " -n 1 -r
  echo
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo $texfiles | xargs -n 1 -P 5 python ./.scripts/py/revise_by_GPT.py -l
  fi
}

revise texfiles

# ./.scripts/sh/revise.sh
