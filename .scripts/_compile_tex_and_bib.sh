function compile_tex_and_bib() {
    echo -e "\nCompiling ./main.tex ..."

    gather_tables
    gather_figures

    yes '' | pdflatex -shell-escape ./main.tex > /dev/null
    bibtex main > /dev/null
    yes '' | pdflatex -shell-escape ./main.tex > /dev/null
    yes '' | pdflatex -shell-escape ./main.tex > /dev/null

    # mv ./main.pdf ./build/main.pdf
    combine_tex_files    
}
