function mv_unnecessary_files() {
    mkdir -p ./logs

    for ext in aux log out bbl blg spl dvi toc bak stderr stdout; do
        mv *.$ext ./logs/ > /dev/null 2>&1
        mv ./build/*.$ext ./logs/ > /dev/null 2>&1  # [REVISED]
    done

    # Handle 'bak' files separately with wildcard
    mv *bak* ./logs/ > /dev/null 2>&1  # [REVISED]
    mv ./build/*bak* ./logs/ > /dev/null 2>&1  # [REVISED]

    for f in ./*.sh; do
        if [ "$f" != "./compile.sh" ]; then
            mv "$f" ./logs/ > /dev/null 2>&1
        fi
    done
}
