c() {
    cd $@
    if [ $? -eq 0 ]; then
        l
    fi
}

http_server() {
    if [ ! $1 ]; then
        port=8000
    else
        port=$1
    fi

    python_version=`python -c 'import sys; print(sys.version_info.major)'`
    if [ $python_version -eq 2 ]; then
        python -m SimpleHTTPServer $port
    else
        python -m http.server $port
    fi
}

tab2space() {
    if [ $# -eq 0 ]; then
        >&2 echo "file expected"
        return 1
    fi

    sed -i "s/\t/    /g" $1
}

dos2unix() {
    sed -i 's/\r//' $1
}

find_crlf() {
    grep -Ulr $'\r'
}

prune_branch() {
    echo 'Delete merged git branch'
    git branch -r --merged | sed 's/origin\///' | xargs git push --delete origin
    git remote prune origin
}
