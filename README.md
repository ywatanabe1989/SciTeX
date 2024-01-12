![CI](https://github.com/ywatanabe1989/LaTeX-Scientific-Template/actions/workflows/compile.yml/badge.svg)

## Scientific Manuscript LaTeX Template (Based on Elsevier's Template)

This LaTeX template is structured according to the guidelines of an [Elsevier scientific manuscript](https://www.elsevier.com/researcher/author/policies-and-guidelines/latex-instructions). It can be adapted for use with other journal guidelines as well.

## Why LaTeX?
LaTeX is ...
- Well-organized
- Consistent
- Easy for writing mathematical expressions
- Compatible with text editors
- Capable of automatic numbering, bookmarking, and referencing
- Straightforward for version tracking
- Synergistic with AI technology

## LaTeX Installation on Ubuntu

To install neccessary pacakges on Ubuntu, run [`./.scripts/sh/install_on_ubuntu.sh`](./.scripts/sh/install_on_ubuntu.sh) as follows:

```bash
$ ./.scripts/sh/install_on_ubuntu.sh
```

## How to use?

``` bash
$ ./compile.sh
$ ./compile.sh -d # Take diff between the last one [-d|--diff]
$ ./compile.sh -r # Revise tex files written in ./configs/files_to_revise.txt [-r|--revise]
$ ./compile.sh -i # Insert citations into files written in ./configs/files_to_revise.txt based on ./bibliography.bib [-i|-insert-citations]
```

[`./compile.sh`](./.scripts/sh/compile.sh): Compiles the tex and bib files to generate [`./compiled.pdf`](./compiled.pdf) and [`./compiled.tex`](./compiled.tex).

## Which Files to Edit?

Files under the [`./src/`](./src/) directory might be sufficient.

## Project Structure

```
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
