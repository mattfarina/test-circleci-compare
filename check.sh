#!/bin/bash

if [ ! -f some.yaml ]; then
    echo "File not found!"
fi

mkdir -p /tmp/some-yaml-cache
cp some.yaml /tmp/some-yaml-cache/some.yaml