function compile_tex_and_bib() {
    echo -e "\nCompiling ./main.tex ..."

    # compile tables and figures
    gather_tables
    gather_figures

    # Main
    yes '' | pdflatex -shell-escape ./main.tex > /dev/null
    bibtex main > /dev/null
    yes '' | pdflatex -shell-escape ./main.tex > /dev/null
    yes '' | pdflatex -shell-escape ./main.tex > /dev/null

    # Rename
    mv main.pdf compiled.pdf
}
