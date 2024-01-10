#!/bin/bash

python -m venv env
source env/bin/activate
python -m pip install -U pip

sudo apt-get install python3-lxml poppler-utils -y

pip install pdf-diff

how can I find the newest pdf file in old_pdfs dir in bash?

  

pdf-diff ./build/main.pdf `find old_pdfs -type f -name "*.pdf" -exec ls -t {} + | head -n 1` > ./build/diff.png
