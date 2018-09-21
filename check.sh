#!/usr/bin/env bash

echo "Starting script..."

changed=False

if [ ! -f /tmp/some-yaml-cache/some.yaml.timestamp ]; then
    echo "Timestamp file not found! Proceed as changed"
    changed=True
else
    # Stat commands here are for linux which is different from macOS (BSDs)
    t1=$(cat /tmp/some-yaml-cache/some.yaml.timestamp)
    t2=$(stat --printf "%Y" some.yaml)
    if [[ t1 != t2 ]]; then
        echo "File timestamp is different. Proceed as change"
        changed=True
    fi
fi

if [[ changed == False ]]; then
    echo "No changes detected."
fi

## update the cache
mkdir -p /tmp/some-yaml-cache
stat --printf "%Y" some.yaml > /tmp/some-yaml-cache/some.yaml.timestamp