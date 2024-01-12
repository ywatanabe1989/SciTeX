#!/usr/bin/env python3
# -*- coding: utf-8 -*-
# Time-stamp: "2024-01-12 13:38:23 (ywatanabe)"

import difflib
import io
import os
import shutil
import sys

import openai
from openai import OpenAI

import wasabi


class ChatGPT(object):
    """
    # version 1.00?
    Example:
        gpt = ChatGPT()
        gpt("Hi")
    """

    def __init__(
        self,
        system_setting="",
        chatgpt_api_key=None,
        model="gpt-4",
    ):
        self.system_setting = system_setting
        self.model = model
        self.counter = 0
        openai.api_key = chatgpt_api_key
        self.client = OpenAI()

        self.chat_history = []
        self.chat_history.append(
            {
                "role": "system",
                "content": system_setting,
            }
        )

    @staticmethod
    def remove_old_history(chat_history, n_limit=1):
        if len(chat_history) > n_limit:
            chat_history = [chat_history[0]] + chat_history[
                len(chat_history) - n_limit :
            ]
        return chat_history

    def __call__(self, text):
        original_stdout = sys.stdout
        sys.stdout = io.StringIO()

        self.counter += 1

        if text is None:
            text = ""
        try:
            self.chat_history.append({"role": "user", "content": text})
            self.chat_history = self.remove_old_history(self.chat_history)

            response = self.client.chat.completions.create(
                model=self.model,
                messages=self.chat_history,
                stream=False,
            )
            out_text = response.choices[0].message.content

            self.chat_history.append({"role": "assistant", "content": out_text})
            sys.stdout = original_stdout

            return out_text

        except Exception as e:
            print(e)
            sys.stdout = original_stdout
            return e


def load_tex(lpath):
    with open(lpath, "r") as file:
        return file.read()


def back_up(path):
    sdir, fname = os.path.split(path)
    old_dir = os.path.join(sdir, ".old")
    os.makedirs(old_dir, exist_ok=True)
    spath = os.path.join(sdir, ".old", fname)
    shutil.copy(path, spath)
    print(f"Backed up: {path} -> {spath}")


def save_tex(text, spath):
    with open(spath, "w", encoding="utf-8") as file:
        file.write(text)


def show_diff(text_1, text_2):
    """
    # Example usage
    text1 = "This is a test.\nThese lines are the same."
    text2 = "This is a test!\nThese lines are the same."
    print(show_diff(text1, text2))
    """
    output = []
    matcher = difflib.SequenceMatcher(None, text_1, text_2)
    for opcode, a0, a1, b0, b1 in matcher.get_opcodes():
        if opcode == "equal":
            output.append(text_1[a0:a1])
        elif opcode == "insert":
            output.append(wasabi.color(text_2[b0:b1], fg=16, bg="green"))
        elif opcode == "delete":
            output.append(wasabi.color(text_1[a0:a1], fg=16, bg="red"))
        elif opcode == "replace":
            output.append(wasabi.color(text_2[b0:b1], fg=16, bg="green"))
            output.append(wasabi.color(text_1[a0:a1], fg=16, bg="red"))
    output = "".join(output)
    return output
