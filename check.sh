#!/usr/bin/env bash

echo "Starting script..."

if [ ! -f /tmp/some-yaml-cache/some.yaml ]; then
    echo "File not found!"
else
    # Check if file contents changed
    d=$(diff /tmp/some-yaml-cache/some.yaml some.yaml)
    if [[ ! -z "$d" ]]; then
        echo "File changed"
    fi

    # Stat commands here are for linux which is different from macOS (BSDs)
    t1=$(stat --printf "%Y" /tmp/some-yaml-cache/some.yaml)
    t2=$(stat --printf "%Y" some.yaml)
    if [[ t1 != t2 ]]; then
        echo "File changed but content was same as reverted version"
    fi
fi

mkdir -p /tmp/some-yaml-cache
cp some.yaml /tmp/some-yaml-cache/some.yaml