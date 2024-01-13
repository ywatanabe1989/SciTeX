#!/bin/bash

OLD_DIR=./old/
COMPILED_PDF=./compiled.pdf
COMPILED_TEX=./compiled.tex
DIFF_TEX=./diff.tex
DIFF_PDF=./diff.pdf

VERSION_COUNTER_TXT="${OLD_DIR}.version_counter.txt"

function versioning() {
    mkdir -p $OLD_DIR
    
    remove_old_versions
    
    count_version
    
    store_pdf
    store_tex
    store_diff_pdf
    store_diff_tex
    }

function remove_old_versions() {
    rm ./compiled_v* -f #  > /dev/bull 2>&1
    rm ./diff_v* -f #> /dev/bull 2>&1
    }

function count_version() {
    if [ ! -f $VERSION_COUNTER_TXT ]; then
        echo "001" > $VERSION_COUNTER_TXT
    else
        version=$(<$VERSION_COUNTER_TXT)
        next_version=$(printf "%03d" $((10#$version + 1)))
        echo $next_version > $VERSION_COUNTER_TXT
    fi
    # echo -e "\n--- Current version is: v${next_version} --- \n"
}

function store_pdf() {
    if [ -f $COMPILED_PDF ]; then
        version=$(<"$VERSION_COUNTER_TXT")

        HIDDEN_LINK="./.compiled.pdf"
        rm $HIDDEN_LINK  > /dev/null 2>&1
        TGT_PATH_CURRENT="./compiled_v${version}.pdf"
        TGT_PATH_OLD="${OLD_DIR}compiled_v${version}.pdf"
        
        cp $COMPILED_PDF $TGT_PATH_CURRENT # rename
        cp $COMPILED_PDF $TGT_PATH_OLD # rename
        rm $COMPILED_PDF
        ln -s $TGT_PATH_CURRENT $HIDDEN_LINK
    fi
}

function store_diff_pdf() {
    if [ -f $DIFF_PDF ]; then
        version=$(<"$VERSION_COUNTER_TXT")

        HIDDEN_LINK="./.diff.pdf"
        rm $HIDDEN_LINK  > /dev/null 2>&1
        TGT_PATH_CURRENT="./diff_v${version}.pdf"
        TGT_PATH_OLD="${OLD_DIR}diff_v${version}.pdf"
        
        cp $DIFF_PDF $TGT_PATH_CURRENT # rename
        cp $DIFF_PDF $TGT_PATH_OLD # rename
        rm $DIFF_PDF
        ln -s $TGT_PATH_CURRENT $HIDDEN_LINK
    fi
}


function store_tex() {
    if [ -f $COMPILED_TEX ]; then
        version=$(<"$VERSION_COUNTER_TXT")

        HIDDEN_LINK="./.compiled.tex"
        rm $HIDDEN_LINK  > /dev/null 2>&1
        
        TGT_PATH_CURRENT="./compiled_v${version}.tex"        
        TGT_PATH_OLD="${OLD_DIR}compiled_v${version}.tex"

        cp $DIFF_TEX $TGT_PATH_CURRENT # rename
        cp $DIFF_TEX $TGT_PATH_OLD # rename
        rm $DIFF_TEX
        ln -s $TGT_PATH_CURRENT $HIDDEN_LINK
    fi
}



function store_diff_tex() {
    if [ -f $COMPILED_TEX ]; then
        version=$(<"$VERSION_COUNTER_TXT")

        HIDDEN_LINK="./.diff.tex"
        rm $HIDDEN_LINK  > /dev/null 2>&1
        
        TGT_PATH_CURRENT="./diff_v${version}.tex"        
        TGT_PATH_OLD="${OLD_DIR}diff_v${version}.tex"

        cp $COMPILED_TEX $TGT_PATH_CURRENT # rename
        cp $COMPILED_TEX $TGT_PATH_OLD # rename
        rm $COMPILED_TEX
        ln -s $TGT_PATH_CURRENT $HIDDEN_LINK
    fi
}


versioning


## EOF
