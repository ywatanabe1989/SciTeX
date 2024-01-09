## Scientific Manuscript LaTeX Template (Based on Elsevier's Template)

This LaTeX template is structured according to the guidelines of an [Elsevier scientific manuscript](https://www.elsevier.com/researcher/author/policies-and-guidelines/latex-instructions). It can be adapted for use with other journal guidelines as well.


## Why LaTeX?
- Provides organized structure and consistent formatting.
- Facilitates easy and precise formatting of mathematical expressions.
- Ensures consistency in text editing, leveraging full text editor capabilities.
- Automates numbering, bookmarking, and reference management.
- Enhances clarity by separating text and media.
- Simplifies version tracking with git.
- Integrates seamlessly with AI tools for language processing.

## LaTeX Installation on Ubuntu

To install LaTeX on Ubuntu, use the following terminal commands:

```bash
$ ./scripts/install_latex_on_ubuntu.sh
```

## How to use?
```bash
$ ./compile.sh
```
[`./compile.sh`](https://github.com/ywatanabe1989/LaTeX-Scientific-Template/blob/main/compile.sh): Compiles the tex and bib files to generate [`./build/main.pdf`](https://github.com/ywatanabe1989/LaTeX-Scientific-Template/blob/main/build/main.pdf).

## Which Files to Edit?

#### Basic structure
[`./build/main.tex`](https://github.com/ywatanabe1989/LaTeX-Scientific-Template/blob/main/build/main.tex/): Defines the manuscript's structure such as IMRaD.

#### References
[`./build/refs.bib`](https://github.com/ywatanabe1989/LaTeX-Scientific-Template/blob/main/build/refs.bib/): Contains the biblography databse in the bibtex format.

#### Figures
[`./src/figures/`](https://github.com/ywatanabe1989/LaTeX-Scientific-Template/blob/main/src/figures//): Stores TIFF images and their legends, which will be automatically inserted to the final pdf as low-resolution, lighter PNG images.

#### Tables
[`./src/tables/`](https://github.com/ywatanabe1989/LaTeX-Scientific-Template/blob/main/src/tables/): Stores Excel (xlsx) files and their legends.

#### Text
[`./text/`](https://github.com/ywatanabe1989/LaTeX-Scientific-Template/blob/main/src/): The directory for writing the manuscript.

#### Styles
[`./styles/`](https://github.com/ywatanabe1989/LaTeX-Scientific-Template/blob/main/styles/): Manages styles such as citation formats.

### Project Structure
[`./tree.txt`](https://github.com/ywatanabe1989/LaTeX-Scientific-Template/blob/main/tree.txt): Updated automatically each time [`./compile.sh`](https://github.com/ywatanabe1989/LaTeX-Scientific-Template/blob/main/compile.sh) is executed.


## Contact

For inquiries or feedback, please reach out to me at ywata1989@gmail.com.
