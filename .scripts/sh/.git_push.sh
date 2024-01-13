#!/bin/bash

latest_version=$(readlink ./old/.compiled.pdf | grep -oP '(?<=compiled_v)\d+')
git add .
git commit -m "v$latest_version"
git push

## shell
