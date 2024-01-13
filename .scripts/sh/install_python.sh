#!/bin/bash

python -m venv .env
source .env/bin/activate
python -m pip install -U pip

pip install -r ./.scripts/py/requirements.txt

## EOF
