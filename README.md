![CI](https://github.com/ywatanabe1989/LaTeX-Scientific-Template/actions/workflows/compile.yml/badge.svg)

## LaTeX Template for Scientific Manuscript (Based on Elsevier's Guidelines), with Integrated Automatic Revision Systems

This LaTeX template is structured in accordance with the guidelines for an [Elsevier scientific manuscript](https://www.elsevier.com/researcher/author/policies-and-guidelines/latex-instructions). It will be also adaptable for other journal guidelines.

## Why LaTeX?
LaTeX is:
- Well-organized
- Consistent
- Convenient for writing mathematical expressions
- Compatible with various text editors
- Equipped with automatic numbering, bookmarking, and referencing
- Efficient for version tracking
- Complementary to AI technology

## LaTeX Installation on Ubuntu

To install necessary packages on Ubuntu, execute the script [`./.scripts/sh/install_on_ubuntu.sh`](./.scripts/sh/install_on_ubuntu.sh) as follows:

```bash
$ ./.scripts/sh/install_on_ubuntu.sh
```

## How to Use?

The script [`./compile.sh`](./.scripts/sh/compile.sh) compiles the file [`./main.tex`](./main.tex) and generates the document [`./compiled.pdf`](./compiled.pdf). The available options include:

```bash
$ ./compile.sh
$ ./compile.sh -d # Compare with the previous version [-d|--diff]
$ ./compile.sh -r # Use ChatGPT to revise TeX files specified in ./configs/files_to_revise.txt [-r|--revise]
$ ./compile.sh -i # Use ChatGPT to insert citations into the files specified in ./configs/files_to_revise.txt from ./bibliography.bib [-i|--insert-citations]
$ ./compile.sh -p # Commit all changes and push the repository to GitHub [-p|--push]
```
Logs can be found at [`./.logs/compile.log`](./.logs/compile.log).

## Which Files to Edit?

Edit the files located in the [`./src/`](./src/) directory.

## Project Structure (Tree)

Refer to [`./.tree.txt`](./.tree.txt), which is automatically generated by executing [`./compile.sh`](./compile.sh).

## Contact

For inquiries or feedback, please contact ywata1989@gmail.com.
