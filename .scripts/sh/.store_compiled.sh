OLD_DIR=./old/
MAIN_PDF=./compiled.pdf
COMPILED_TEX=./compiled.tex
DIFF_TEX=./diff.tex
VERSION_COUNTER_TXT="${OLD_DIR}.version_counter.txt"

function store_compiled() {
    count_version
    store_pdf
    store_tex
    store_diff_tex
    }

function store_pdf() {
    mkdir -p $OLD_DIR
    if [ -f $MAIN_PDF ]; then
        version=$(<"$VERSION_COUNTER_TXT")

        HIDDEN_LINK="./.compiled.pdf"
        rm $HIDDEN_LINK  > /dev/null 2>&1
        TGT_PATH_CURRENT="./compiled_v${version}.pdf"
        TGT_PATH_OLD="${OLD_DIR}compiled_v${version}.pdf"
        
        cp $MAIN_PDF $TGT_PATH_CURRENT # rename
        cp $MAIN_PDF $TGT_PATH_OLD # rename
        rm $MAIN_PDF
        ln -s $TGT_PATH_CURRENT $HIDDEN_LINK
    fi
}

function store_tex() {
    mkdir -p $OLD_DIR
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
    mkdir -p $OLD_DIR
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


function count_version() {
    mkdir -p $OLD_DIR
    if [ ! -f $VERSION_COUNTER_TXT ]; then
        echo "001" > $VERSION_COUNTER_TXT
    else
        version=$(<$VERSION_COUNTER_TXT)
        next_version=$(printf "%03d" $((10#$version + 1)))
        echo $next_version > $VERSION_COUNTER_TXT
    fi
    echo -e "\n--- v${next_version} ---"
}
