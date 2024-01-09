## Scientific Manuscript LaTeX Template (Based on Elsevier's Template)

This LaTeX template is structured according to the guidelines of an [Elsevier scientific manuscript](https://www.elsevier.com/researcher/author/policies-and-guidelines/latex-instructions). It can be adapted for use with other journal guidelines as well.


## Why LaTeX?
- Organized structure and formatting.
- Enhanced clarity through text and media separation.
- Easy tracking for version control.
- Streamlined reference management.
- Precise mathematical expression formatting.
- Automated numbering and bookmarking.
- Productivity will be accelerated by writing with your editor.
- Compatibility with AI generative models.

## LaTeX Installation on Ubuntu

To install LaTeX on Ubuntu, use the following terminal commands:

```bash
sudo apt update
sudo apt-get install texlive-full -y
sudo apt-get install tree -y
```

### Project Structure

```
.
├── build
│   ├── main_combined.tex
│   ├── main.pdf
│   ├── main.tex
│   └── refs.bib
├── compile.sh
├── logs
│   └── ...
├── media
│   ├── figures
│   │   ├── legend
│   │   │   ├── Figure_ID_01.tex
│   │   │   ├── Figure_ID_02.tex
│   │   │   │   ...
│   │   │   └── Figure_ID_07.tex
│   │   └── tif
│   │       ├── Figure_ID_01.tif
│   │       ├── Figure_ID_02.tif
│   │       │   ...
│   │       └── Figure_ID_07.tif
│   └── tables
│       ├── legend
│       │   ├── Table_ID_01.tex
│       │   ├── Table_ID_02.tex
│       │   └── Table_ID_03.tex
│       └── xlsx
│           ├── Table_ID_01.xlsx
│           ├── Table_ID_02.xlsx
│           └── Table_ID_03.xlsx
├── old_versions
│   ├── main-2024-0109-09:13PM.pdf
│   ├── main-2024-0109-09:03PM.pdf
│   │   ...
│   └── main-2024-0108-09:32PM.pdf
├── README.md
├── scripts
│   ├── checks.sh
│   ├── cleanup.sh
│   ├── compile.sh
│   ├── figures.sh
│   ├── pdf.sh
│   └── tables.sh
├── src
│   ├── additional
│   │   ├── additional_info.tex
│   │   └── appendices.tex
│   ├── IMRaD
│   │   ├── 0_abstract.tex
│   │   ├── 1_introduction.tex
│   │   ├── 2_methods.tex
│   │   ├── 3_results.tex
│   │   └── 4_discussion.tex
│   └── top
│       ├── abstract.tex -> ../IMRaD/0_abstract.tex
│       ├── graphical_abstract.tex
│       ├── highlights.tex
│       ├── keywords.tex
│       └── title.tex
├── styles
│   ├── bibliography.tex
│   ├── formatting.tex
│   └── packages.tex
└── tree.txt
```



## What do you need to edit?

#### Generates a PDF file
`./compile.sh`: Generates `./build/main.pdf` by compiling the tex and bib files.

#### Basic structure
`./build/main.tex`: The structure of the manuscript.

#### References
`./build/refs.bib`: The database for references.

#### Figures
`./media/figures/`: Where you store TIFF images and their legends.

#### Tables
`./media/tables/`: Where you store Excel (xlsx) files and their legends.

#### Manuscript
`./src/`: Where you write your manuscript.

#### Styles
`./styles/`: Where you controls styles like citation styles.

## Contact

For inquiries or feedback, please reach out to me at ywata1989@gmail.com.
