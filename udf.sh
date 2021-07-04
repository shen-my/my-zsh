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

dirm_all_tags() {
    docker rmi $(docker images $1 --format "{{.Repository}}:{{.Tag}}")
}

expose_docker_port() {
    if [ $# -lt 3 ]; then
        >&2 echo "
        Usage:
        expose_docker_port {network} {container_host} {container_port}    # local_port=container_port
        expose_docker_port {network} {container_host} {container_port} {local_port}
        ps: default network is "bridge"
        "
        return 1
    fi
    network=$1
    container_host=$2
    container_port=$3
    if [ $# -eq 4 ]; then
        local_port=$4
    else
        local_port=$3
    fi

    docker run -it --rm \
        -p $local_port:1234 \
        --network $network \
        alpine/socat \
        tcp-listen:1234,fork,reuseaddr tcp-connect:$container_host:$container_port
}
