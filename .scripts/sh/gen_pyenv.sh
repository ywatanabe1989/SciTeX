#!/bin/bash

python -m venv .env
# source .env/bin/activate
./.env/bin/python -m pip install -U pip
./.env/bin/python -m pip install -r ./.scripts/py/requirements.txt

## EOF
