gen_the_compiled_tex_file() {
    main_file="./main.tex"
    output_file="./compiled.tex"
    cp "$main_file" "$output_file"

    process_input() {
        local file_path="$1"
        local temp_file=$(mktemp) # Create a temporary file to avoid reading and writing the same file

        while IFS= read -r line; do
            if [[ "$line" =~ \\input\{(.+)\} ]]; then
                local input_path="${BASH_REMATCH[1]}.tex"
                if [[ -f "$input_path" ]]; then
                    echo "Processing $input_path"
                    cat "$input_path" >> "$temp_file" # Append the content of the input file to the temp file
                else
                    echo "Warning: File $input_path not found."
                    echo "$line" >> "$temp_file" # Keep the original \input line if the file is not found
                fi
            else
                echo "$line" >> "$temp_file" # Copy the line to the temp file
            fi
        done < "$file_path"

        mv "$temp_file" "$output_file" # Replace the output file with the temp file
    }

    # Call process_input on the output file and repeat until no \input commands are left
    while grep -q '\\input{' "$output_file"; do
        process_input "$output_file"
    done

    echo -e "\nCompiled file created: $output_file"
}
