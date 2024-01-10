function excel2tex() {
    rm ./src/tables/.tex/*.tex > /dev/null
    
    xlsx_directory="./src/tables/xlsx/"
    csv_directory="./src/tables/.csv/"
    output_directory_tmp="./src/tables/.tex/.tmp/"
    output_directory="./src/tables/.tex/"    
    legend_directory="./src/tables/legend/"

    mkdir -p $xlsx_directory $csv_directory $output_directory $output_directory_tmp > /dev/null

    ii=0
    for xlsx_file in "$xlsx_directory"*.xlsx; do
        base_name=$(basename "$xlsx_file" .xlsx)
        table_id=$(echo "$base_name" | grep -oP '(?<=Table_ID_)[^\.]+')
        table_id=$(echo $table_id | tr '[:upper:]' '[:lower:]')
        
        xlsx2csv "$xlsx_file" > "$csv_directory${base_name}.csv"
        csv2latex "$csv_directory${base_name}.csv" > "$output_directory_tmp${base_name}.tex"

        # create the final tex file
        rm "$output_directory${base_name}.tex" > /dev/null 2>&1
        if [ $ii -gt 0 ]; then # [REVISED]
            echo "\\clearpage" >> "$output_directory${base_name}.tex"
        fi
        ii=$((ii+1)) # [REVISED]        

        echo "\\pdfbookmark[2]{ID ${table_id}}{id_${table_id}}" >> "$output_directory${base_name}.tex"   
        echo "\\begin{table*}[ht]" >> "$output_directory${base_name}.tex"
        echo "\\centering" >> "$output_directory${base_name}.tex"
        # echo "\\rowcolors{3}{gray!25}{white}" >> "$output_directory${base_name}.tex"
        # echo "\\toprule" >> "$output_directory${base_name}.tex"
        # echo "\\rowcolor{white}" >> "$output_directory${base_name}.tex"
        # echo "\\midrule"  >> "$output_directory${base_name}.tex"
        # Insert the table data from the temp file
        tail -n +2 "$output_directory_tmp${base_name}.tex" | head -n -2 | grep -v -E '\\usepackage\[T1\]\{fontenc\}|\\usepackage\[utf8\]\{inputenc\}|\\begin\{document\}' >> "$output_directory${base_name}.tex" # [REVISED]
        # tail -n +2 "$output_directory_tmp${base_name}.tex" | head -n -2 >> "$output_directory${base_name}.tex"
        echo "\\bottomrule"  >> "$output_directory${base_name}.tex"
        echo "\\end{tabular}"  >> "$output_directory${base_name}.tex"
        cat "${legend_directory}${base_name}.tex" >> "$output_directory${base_name}.tex" # caption
        echo "\\label{tab:${table_id}}" >> "$output_directory${base_name}.tex" # [REVISED]
        echo "\\end{table*}" >> "$output_directory${base_name}.tex"

        # rm "$csv_directory${base_name}.csv"                

    done

    # echo -e "\nConversion from .xlsx to .tex completed."
}


function gather_tables() {
    excel2tex
    rm ./src/tables/.tex/.All_Tables.tex > /dev/null 2>&1
    for table_tex in ./src/tables/.tex/Table_*.tex; do
        fname="${table_tex%.tex}"
	    echo "\input{${fname}}" >> ./src/tables/.tex/.All_Tables.tex
	done
}
