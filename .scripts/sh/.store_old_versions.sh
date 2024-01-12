OLD_DIR=./old/
MAIN_PDF=./main.pdf
COMBINED_TEX=./combined.tex
VERSION_COUNTER_TXT="${OLD_DIR}.version_counter.txt"

function store_old() {
    count_version
    store_pdf
    store_tex
    }

function store_pdf() {
    mkdir -p $OLD_DIR
    if [ -f $MAIN_PDF ]; then
        version=$(<"$VERSION_COUNTER_TXT")
        cp $MAIN_PDF "${OLD_DIR}v${version}.pdf"
    fi
}

function store_tex() {
    mkdir -p $OLD_DIR
    if [ -f $COMBINED_TEX ]; then
        version=$(<"$VERSION_COUNTER_TXT")
        cp $COMBINED_TEX "${OLD_DIR}v${version}.tex"
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
