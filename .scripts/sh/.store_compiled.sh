OLD_DIR=./old/
MAIN_PDF=./compiled.pdf
COMPILED_TEX=./compiled.tex
VERSION_COUNTER_TXT="${OLD_DIR}.version_counter.txt"

function store_compiled() {
    count_version
    store_pdf
    store_tex
    }

function store_pdf() {
    mkdir -p $OLD_DIR
    if [ -f $MAIN_PDF ]; then
        version=$(<"$VERSION_COUNTER_TXT")
        # cp $MAIN_PDF "${OLD_DIR}compiled_v${version}.pdf"
        TGT_PATH="${OLD_DIR}compiled_v${version}.pdf"
        mv $MAIN_PDF $TGT_PATH
        ln -s $TGT_PATH $MAIN_PDF
    fi
}

function store_tex() {
    mkdir -p $OLD_DIR
    if [ -f $COMPILED_TEX ]; then
        version=$(<"$VERSION_COUNTER_TXT")
        # cp $COMPILED_TEX "${OLD_DIR}compiled_v${version}.tex"
        TGT_PATH="${OLD_DIR}compiled_v${version}.tex"
        mv $COMPILED_TEX $TGT_PATH        
        ln -s $TGT_PATH $COMPILED_TEX
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
