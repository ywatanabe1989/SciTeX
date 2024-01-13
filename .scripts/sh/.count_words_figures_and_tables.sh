#!/bin/bash

# Count tables and figures
table_count=$(grep -o '\\begin{table}' ./src/*.tex | wc -l)
figure_count=$(grep -o '\\begin{figure}' ./src/*.tex | wc -l)
echo "$table_count tables; $figure_count figures;" > ./src/.n_tables_and_figures.txt

# Calculate word counts for each section and save to files
texcount ./src/abstract.tex -inc -1 -sum > ./src/.wordcount_abstract.txt
texcount ./src/introduction.tex -inc -1 -sum > ./src/.wordcount_introduction.txt
texcount ./src/methods.tex -inc -1 -sum > ./src/.wordcount_methods.txt
texcount ./src/results.tex -inc -1 -sum > ./src/.wordcount_results.txt
texcount ./src/discussion.tex -inc -1 -sum > ./src/.wordcount_discussion.txt

# Calculate word count for IMRaD excluding abstract
(texcount ./src/introduction.tex -inc -1 -sum;
 texcount ./src/methods.tex -inc -1 -sum;
 texcount ./src/results.tex -inc -1 -sum;
 texcount ./src/discussion.tex -inc -1 -sum) | awk '{s+=$1} END {print s}' > ./src/.wordcount_imrd.txt

## EOF
