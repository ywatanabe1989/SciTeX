#!/bin/bash

latest_version=$(readlink .compiled.pdf | grep -oP '(?<=compiled_v)\d+')
git add .
git commit -m "v$latest_version" # [REVISED]
git push

## shell
