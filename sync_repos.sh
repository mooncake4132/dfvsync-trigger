#!/bin/bash
set -ex

DFVSYNC_PACKAGE=git+https://github.com/mooncake4132/dfvsync


trigger_dfvsync() {
    url=$1

    tmpdir=$(mktemp -d)
    git clone "$url" "$tmpdir"
    pushd "$tmpdir"
    ls

    pip3 install "$DFVSYNC_PACKAGE"
    python3 -m dfvsync
}


repos=$(cat .repos.txt)
for url in $repos
do
    trigger_dfvsync "$url"
done
