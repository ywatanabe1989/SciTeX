#!/usr/bin/env python3
# -*- coding: utf-8 -*-
# Time-stamp: "2024-01-12 14:08:30 (ywatanabe)"


import os
import sys

sys.path.append("./.scripts/py/")
from utils import ChatGPT, back_up, load_tex, save_tex, show_diff


def insert_citations(lpath_tex, lpath_bib):
    # Parameters
    OPENAI_API_KEY = os.getenv("OPENAI_API_KEY")

    # Instantiates GPT
    gpt = ChatGPT(OPENAI_API_KEY, model="gpt-4-1106-preview")

    # Load text files
    tex_contents = load_tex(lpath_tex)
    bib_contents = load_tex(lpath_bib)

    # Instruction
    prompt = f"""
        Please insert citations at appropriate places in the tex file below, from the bib file below.
        
        Note that:
        - Do not change the original text, including all LaTeX commands, of course including indentation, except for citation management.
        - Do not include any comments in your output. This is because the original tex file will be overrided with your output.
        - The original tex manuscript for citations to be inserted is as follows:\n{tex_contents}
        - The bibliography file to be refered to is as follows:\n{bib_contents}
        - Do not care about tags like \bibliographystyle and \bibliography; they are compiled from other tex files afterwords. So, do not include them when they are not included, and keep them as they are when included.
        - Forget about the tags \bibliographystyle and \bibliography; they will be compiled from other TeX files subsequently when they are not included. Therefore, exclude them if they are not present, and leave them unchanged if they are included.
        """

    # Main
    print(f"Inserting citations to {lpath_tex} based on {lpath_bib}...")
    inserted_text = gpt(prompt)

    # Copy the original tex under the ./orig dir in its directory
    back_up(lpath_tex)

    # Saves
    spath = lpath_tex.replace(".tex", "_cited.tex")
    save_tex(inserted_text, spath) # fxime: \indent disappears
    print(f"Citations were inserted to: {spath}")

    # Show diff between the original and inserted_text
    show_diff(tex_contents, inserted_text)


if __name__ == "__main__":
    import argparse

    parser = argparse.ArgumentParser()
    parser.add_argument("--lpath_tex", "-lt", default="./src/introduction.tex")
    parser.add_argument("--lpath_bib", "-lb", default="./bibliography.bib")
    args = parser.parse_args()

    insert_citations(args.lpath_tex, args.lpath_bib)

    # python ./.scripts/insert_citations.py -lt ./src/introduction.tex -lb ./bibliography.bib
    # cat ./src/introduction_cited.tex
