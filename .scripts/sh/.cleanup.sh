function mv_unnecessary_files() {
    LOGDIR=./.logs
    mkdir -p $LOGDIR

    # find . -f *back* | echo rm
    find . -type f -name "*bak*" -exec rm {} +    
    # rm *bak* > /dev/null 2>&1
    rm ${LOGDIR}*bak* > /dev/null 2>&1    
    
    for ext in aux log out bbl blg spl dvi toc bak stderr stdout; do
        mv *.$ext $LOGDIR > /dev/null 2>&1        
    done
}
