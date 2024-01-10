#!/bin/bash

# https://github.com/vslavik/diff-pdf

sudo apt-get install make automake g++ -y
sudo apt-get install libpoppler-glib-dev poppler-utils libwxgtk3.0-gtk3-dev -y

git clone https://github.com/vslavik/diff-pdf.git
mv diff-pdf ./scripts/

cd ./scripts/diff-pdf

## EOF
./bootstrap
./configure
make
make install
