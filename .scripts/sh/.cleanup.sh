function mv_unnecessary_files() {
    LOGDIR=./.logs
    mkdir -p $LOGDIR

    for ext in aux log out bbl blg spl dvi toc bak stderr stdout; do
        mv *.$ext $LOGDIR > /dev/null 2>&1        
        # mv ./build/*.$ext $LOGDIR > /dev/null 2>&1  # [REVISED]        
    done

    # Handle 'bak' files separately with wildcard
    rm *bak* > /dev/null 2>&1  # [REVISED]    
    # mv *bak* $LOGDIR/ > /dev/null 2>&1  # [REVISED]
    # mv ./build/*bak* $LOGDIR/ > /dev/null 2>&1  # [REVISED]

    # for f in ./*.sh; do
    #     if [ "$f" != "./compile.sh" ]; then
    #         mv "$f" $LOGDIR/ > /dev/null 2>&1
    #     fi
    # done
}
