#!/bin/bash

# Count tables
table_count=`ls ./src/tables/*.tex | wc -l`
echo $table_count > ./src/.table_count.txt

# Count figures
figure_count=`ls ./src/figures/*.tex | wc -l`
echo $figure_count > ./src/.figure_count.txt

# Calculate word counts for each section and save to files
texcount ./src/abstract.tex -inc -1 -sum > ./src/.abstract_count.txt
texcount ./src/introduction.tex -inc -1 -sum > ./src/.introduction_count.txt
texcount ./src/methods.tex -inc -1 -sum > ./src/.methods_count.txt
texcount ./src/results.tex -inc -1 -sum > ./src/.results_count.txt
texcount ./src/discussion.tex -inc -1 -sum > ./src/.discussion_count.txt

# Calculate word count for IMRaD excluding abstract
(texcount ./src/introduction.tex -inc -1 -sum;
 texcount ./src/methods.tex -inc -1 -sum;
 texcount ./src/results.tex -inc -1 -sum;
 texcount ./src/discussion.tex -inc -1 -sum) | awk '{s+=$1} END {print s}' > ./src/.imrd_count.txt

## EOF
