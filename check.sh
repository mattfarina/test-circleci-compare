#!/usr/bin/env bash

echo "Starting script..."

if [ ! -f /tmp/some-yaml-cache/some.yaml ]; then
    echo "File not found!"
else
    d=$(diff /tmp/some-yaml-cache/some.yaml some.yaml)
    if [[ ! -z "$d" ]]; then
        echo "File changed"
    fi
fi

mkdir -p /tmp/some-yaml-cache
cp some.yaml /tmp/some-yaml-cache/some.yaml