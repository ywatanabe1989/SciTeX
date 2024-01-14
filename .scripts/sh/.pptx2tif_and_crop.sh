#!/bin/bash

# PowerPoint to TIF
for pptx_file in ./src/figures/Figure_ID_*.pptx; do
    ./.scripts/sh/.pptx2tif.sh $pptx_file
done

# Crop
for tif_file in ./src/figures/Figure_ID*.tif; do
    ./.env/bin/python ./.scripts/py/crop_tif.py -l $tif_file
done

## EOF
