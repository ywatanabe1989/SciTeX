function print_success() {
    echo ''
    if [ -f ./main.pdf ]; then
        echo "Congratulations! main.pdf is ready."
    else
        echo "Something went wrong. Please check log files under logs/"
    fi
}

