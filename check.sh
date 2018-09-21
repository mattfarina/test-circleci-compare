#!/usr/bin/env bash

echo "Starting script..."

changed=False

if [ ! -f /tmp/some-yaml-cache/some.yaml ]; then
    echo "Cached copy not found! Proceed as changed"
    changed=True
else
    # Stat commands here are for linux which is different from macOS (BSDs)
    d=$(diff /tmp/some-yaml-cache/some.yaml some.yaml)
    if [[ ! -z $s ]]; then
        echo "New config is different from previous. Proceed as change"
        changed=True
    fi
fi

if [[ changed == False ]]; then
    echo "No changes detected."
fi

## update the cache
mkdir -p /tmp/some-yaml-cache
cp some.yaml /tmp/some-yaml-cache/some.yaml