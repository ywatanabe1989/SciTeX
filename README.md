![CI](https://github.com/ywatanabe1989/LaTeX-Scientific-Template/actions/workflows/main.yml/badge.svg)

## Scientific Manuscript LaTeX Template (Based on Elsevier's Template)

This LaTeX template is structured according to the guidelines of an [Elsevier scientific manuscript](https://www.elsevier.com/researcher/author/policies-and-guidelines/latex-instructions). It can be adapted for use with other journal guidelines as well.


## Why LaTeX?
- Provides organized structure and consistent formatting.
- Facilitates easy and precise formatting of mathematical expressions.
- Ensures consistency in text editing, leveraging full text editor capabilities.
- Automates numbering, bookmarking, and reference management.
- Enhances clarity by separating text and Figures & Tables.
- Simplifies version tracking with git.
- Integrates seamlessly with AI tools for language processing.

## LaTeX Installation on Ubuntu

To install neccessary pacakges on Ubuntu, run [`./.scripts/install_on_ubuntu.sh`](./scripts/.install_on_ubuntu.sh) as follows:

```bash
$ ./.scripts/install_on_ubuntu.sh
```

## How to use?

``` bash
$ ./compile.sh
```

[`./compile.sh`](./compile.sh): Compiles the tex and bib files to generate [`./main.pdf`](./main.pdf).

## Which Files to Edit?

Please edit files under the [`./src/`](./src/) directory.

## Project Structure

```
TREE_PLACEHOLDER
.
├── bibliography.bib
├── combined.tex
├── compile.sh -> .scripts/compile.sh
├── main.pdf
├── main.tex
├── old
│   ├── main-v008.pdf
│   ├── main-v008.tex
│   ├── main-v009.pdf
│   ├── main-v009.tex
│   ├── main-v010.pdf
│   ├── main-v010.tex
│   ├── main-v011.pdf
│   ├── main-v011.tex
│   ├── main-v012.pdf
│   └── main-v012.tex
├── #README.md#
├── README.md
├── src
│   ├── abstract.tex
│   ├── additional_info.tex
│   ├── appendices.tex
│   ├── discussion.tex
│   ├── figures
│   │   ├── Figure_ID_01.tex
│   │   ├── Figure_ID_01.tif
│   │   ├── Figure_ID_02.tex
│   │   ├── Figure_ID_02.tif
│   │   ├── Figure_ID_03.tex
│   │   ├── Figure_ID_03.tif
│   │   ├── Figure_ID_04.tex
│   │   ├── Figure_ID_04.tif
│   │   ├── Figure_ID_05.tex
│   │   ├── Figure_ID_05.tif
│   │   ├── Figure_ID_06.tex
│   │   ├── Figure_ID_06.tif
│   │   ├── Figure_ID_07.tex
│   │   └── Figure_ID_07.tif
│   ├── graphical_abstract.tex
│   ├── highlights.tex
│   ├── introduction.tex
│   ├── journal_name.tex
│   ├── keywords.tex
│   ├── methods.tex
│   ├── results.tex
│   ├── styles
│   │   ├── bibliography.tex
│   │   ├── formatting.tex
│   │   └── packages.tex
│   ├── tables
│   │   ├── Table_ID_01.csv
│   │   ├── Table_ID_01.tex
│   │   ├── Table_ID_02.csv
│   │   ├── Table_ID_02.tex
│   │   ├── Table_ID_03.csv
│   │   └── Table_ID_03.tex
│   └── title.tex
└── tree.txt

5 directories, 53 files
```

## Contact

For inquiries or feedback, please reach out to me at ywata1989@gmail.com.
