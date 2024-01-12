#!/usr/bin/env python3
# -*- coding: utf-8 -*-
# Time-stamp: "2024-01-12 16:26:15 (ywatanabe)"


import os
import sys

sys.path.append("./.scripts/py/")
from utils import ChatGPT, load_tex, back_up, save_tex


def revise_by_GPT(lpath):
    # Parameters
    OPENAI_API_KEY = os.getenv("OPENAI_API_KEY")

    # Instantiates GPT
    gpt = ChatGPT(OPENAI_API_KEY)
    text = load_tex(lpath)
    revise_instruction = """
    You are an esteemed professor in the scientific field, based in the United States. The subsequent passages originate from a student whose first language is not English. Please proofread these sentences in a manner that retains their original syntax as much as possible, yet conforms to the language style typical of a scholarly article in biology. Please do not modify any sections that do not pose linguistic challenges. Please keep the original sentences as much as possible and minimize your revisions because if you paraphrase expressions every time, this revision process will never end. No comments are required beyond the revised text. Any included LaTeX commands should be preserved or corrected as appropriate, in recognition that the student is authoring their manuscript in LaTeX. The original manuscript to be revised is as follows:
    """

    # Main
    print(f"Revising {lpath} ...")
    revised_text = gpt(revise_instruction + text)

    # Copy the original tex under the ./orig dir in its directory
    back_up(lpath)

    # Saves
    spath = lpath.replace(".tex", "_revised.tex")
    save_tex(revised_text, lpath)
    print(f"Revised: {lpath}")


if __name__ == "__main__":
    import argparse

    parser = argparse.ArgumentParser()
    parser.add_argument("--lpath", "-l")
    args = parser.parse_args()

    revise_by_GPT(args.lpath)

    # python ./.scripts/_revise_by_GPT.py -l ./src/abstract.tex
