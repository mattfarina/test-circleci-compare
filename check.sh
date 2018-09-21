#!/usr/bin/env bash

echo "Starting script..."

if [ ! -f /tmp/some-yaml-cache/some.yaml ]; then
    echo "Cached copy not found! Proceed as changed"
else
    # Stat commands here are for linux which is different from macOS (BSDs)
    d=$(diff /tmp/some-yaml-cache/some.yaml some.yaml)
    if [[ ! -z $s ]]; then
        echo "New config is different from previous. Proceed as change"
    else
        echo "No changes detected."
    fi
fi

## update the cache
mkdir -p /tmp/some-yaml-cache
cp some.yaml /tmp/some-yaml-cache/some.yaml