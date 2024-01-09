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

To install neccessary pacakges on Ubuntu, run [`./scripts/install_on_ubuntu.sh`](./scripts/install_on_ubuntu.sh) as follows:

```bash
$ ./scripts/install_on_ubuntu.sh
```

## How to use?
```bash
$ ./compile.sh
```
[`./compile.sh`](./compile.sh): Compiles the tex and bib files to generate [`./build/main.pdf`](./build/main.pdf).

## Which Files to Edit?

#### Basic structure
[`./build/main.tex`](./build/main.tex/): Defines the manuscript's structure such as IMRaD.

#### References
[`./build/refs.bib`](./build/refs.bib/): Contains the biblography databse in the bibtex format.

#### Figures
[`./src/figures/`](./src/figures//): Stores TIFF images and their legends, which will be automatically inserted to the final pdf as low-resolution, lighter PNG images.

#### Tables
[`./src/tables/`](./src/tables/): Stores Excel (xlsx) files and their legends.

#### Text
[`./text/`](./src/): The directory for writing the manuscript.

#### Styles
[`./styles/`](./styles/): Manages styles such as citation formats.

### Project Structure
[`./tree.txt`](./tree.txt): Updated automatically each time [`./compile.sh`](./compile.sh) is executed.

```
TREE_PLACEHOLDER
```




## Contact

For inquiries or feedback, please reach out to me at ywata1989@gmail.com.
