#!/bin/bash

# tree -I "compiled_*|diff_*|*.pyc|*.cpython-38.pyc|*.so|*.pdf|*.tif|*.csv|*.ipynb|env|__pycache__|*.dist-info|*.whl|*.exe|*.tmpl|*.sh|cache|*.txt|*.md|manually_edited|old|*.xml|*.1" configs/ > configs/.tree.txt

tree -I "compiled_*|diff_*|*.pyc|*.cpython-38.pyc|*.so|*.pdf|*.tif|*.csv|*.ipynb|env|__pycache__|*.dist-info|*.whl|*.exe|*.tmpl|*.sh|cache|*.txt|*.md|manually_edited|old|*.xml|*.1|*pptx" configs/ > configs/.tree.txt
## EOF
