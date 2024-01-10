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
        cp $MAIN_PDF "${OLD_DIR}main-v${version}.pdf"
    fi
}

function store_tex() {
    mkdir -p $OLD_DIR
    if [ -f $COMBINED_TEX ]; then
        version=$(<"$VERSION_COUNTER_TXT")
        cp $COMBINED_TEX "${OLD_DIR}main-v${version}.tex"
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
    echo -e "\n--- version ${version} ---"
}

# Missing closing brackets for the functions were added. [REVISED]
# Corrected the variable name VERSIONG_COUNTER_TXT to VERSION_COUNTER_TXT. [REVISED]
# Fixed the variable name MAIN_tex to COMBINED_TEX. [REVISED]
# Added versioning to the copied PDF and TEX files. [REVISED]
# Corrected the path used to read the version number. [REVISED]


# # function store_old_pdf() {
# #     mkdir -p ./.old_pdfs/
# #     VERSIONG_COUNTER_TXT="./.old_pdfs/.version_counter.txt"
# #     if [ -f ./main.pdf ]; then
# #         if [ ! -f $VERSIONG_COUNTER_TXT ]; then
# #             # touch $VERSIONG_COUNTER_TXT
# #             echo "0001" > $VERSIONG_COUNTER_TXT
# #         fi
# #         version=$(<$./.version_counter.txt)
# #         mv ./main.pdf "./.old_pdfs/main-${version}.pdf"
# #         next_version=$(printf "%04d" $((10#$version + 1)))
# #         echo $next_version > $VERSION_COUNTER_TXT
# #     fi
# # }

# OLD_DIR=./old/
# MAIN_PDF=./main.pdf
# MAIN_tex=./main.tex
# VERSIONG_COUNTER_TXT="${OLD_DIR}.version_counter.txt"
    
# function store_pdf() {
#     mkdir -p $OLD_DIR
#     if [ -f $MAIN_PDF ]; then
#         cp $MAIN_PDF ${OLD_DIR}${MAIN_PDF} 
#     }

# function store_tex() {
#     mkdir -p $OLD_DIR
#     if [ -f $COMBINED_TEX ]; then
#         cp $COMBINED_TEX ${OLD_DIR}${COMBINED_TEX} 
#     }

# func

# function count_version() {
#     mkdir -p $OLD_DIR
#     # VERSIONG_COUNTER_TXT="./.old_pdfs/.version_counter.txt"
#     if [ ! -f $VERSIONG_COUNTER_TXT ]; then
#         # touch $VERSIONG_COUNTER_TXT
#         echo "0001" > $VERSIONG_COUNTER_TXT
#     fi
#     version=$(<$./.version_counter.txt)
#     next_version=$(printf "%04d" $((10#$version + 1)))
#     echo $next_version > $VERSION_COUNTER_TXT
#     echo $version
#     }
