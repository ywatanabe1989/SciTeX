#!/bin/bash

inputFilePath=$1 # must be fullpath

echo -e "\nConverting ${inputFilePath}..."

inputFilePathWin=$(wslpath -w "$inputFilePath")

if [ "$#" -eq 2 ]; then
    outputFilePath=$2
    outputFilePathWin=$(wslpath -w "$outputFilePath")
else
    outputFilePathWin=${inputFilePathWin%.pptx}.tif
fi

# Run the PowerShell script
powershell.exe -ExecutionPolicy Bypass -File "$(wslpath -w ./.scripts/ps1/pptx2tiff.ps1)" -inputFilePath "$inputFilePathWin" -outputFilePath "$outputFilePathWin"


if [ -n "$inputFilePath" ]; then
   echo -e "\nConverted: ${inputFilePath} -> ${inputFilePath%.pptx}.tif"
fi

# ./.scripts/sh/.pptx2tif.sh src/figures/Figure_ID_01.pptx

## EOF
