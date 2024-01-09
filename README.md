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

## How to use?
[`./compile.sh`](https://github.com/ywatanabe1989/LaTeX-Scientific-Template/blob/main/compile.sh): Generates [`./build/main.pdf`](https://github.com/ywatanabe1989/LaTeX-Scientific-Template/blob/main/build/main.pdf) by compiling the tex and bib files.

## Which files to edit?

#### Basic structure
[`./build/main.tex`](https://github.com/ywatanabe1989/LaTeX-Scientific-Template/blob/main/build/main.tex/): The structure of the manuscript.

#### References
[`./build/refs.bib`](https://github.com/ywatanabe1989/LaTeX-Scientific-Template/blob/main/build/refs.bib/): The database for references.

#### Figures
[`./media/figures/`](https://github.com/ywatanabe1989/LaTeX-Scientific-Template/blob/main/media/figures//): Where you store TIFF images and their legends.

#### Tables
[`./media/tables/`](https://github.com/ywatanabe1989/LaTeX-Scientific-Template/blob/main/media/tables/): Where you store Excel (xlsx) files and their legends.

#### Manuscript
[`./src/`](https://github.com/ywatanabe1989/LaTeX-Scientific-Template/blob/main/src/): Where you write your manuscript.

#### Styles
[`./styles/`](https://github.com/ywatanabe1989/LaTeX-Scientific-Template/blob/main/styles/): Where you controls styles like citation styles.

### Project Structure
[`./tree.txt`](https://github.com/ywatanabe1989/LaTeX-Scientific-Template/blob/main/tree.txt)


## Contact

For inquiries or feedback, please reach out to me at ywata1989@gmail.com.
