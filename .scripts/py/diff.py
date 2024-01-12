#!/usr/bin/env python3
# -*- coding: utf-8 -*-
# Time-stamp: "2024-01-12 14:05:21 (ywatanabe)"

import os
import sys

sys.path.append("./.scripts/py/")
from utils import load_tex, save_tex, show_diff


def to_diff_file(lpath_1, lpath_2, spath):
    text_1 = load_tex(lpath_1)
    text_2 = load_tex(lpath_2)

    diff = show_diff(text_1, text_2)

    print(diff)

    if spath != "":        
        save_tex(diff, spath)
        print(f"Saved to: {spath}")


if __name__ == "__main__":
    import argparse

    parser = argparse.ArgumentParser()
    parser.add_argument("lpath_1")
    parser.add_argument("lpath_2")
    parser.add_argument("--spath", default="")
    args = parser.parse_args()

    to_diff_file(args.lpath_1, args.lpath_2, args.spath)

    """
    python ./.scripts/py/diff.py ./src/introduction.tex ./src/introduction_cited.tex
    
    python ./.scripts/py/diff.py ./src/introduction.tex ./src/introduction_cited.tex --spath ./diff.diff
    cat ./diff.diff
    """
