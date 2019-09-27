#!/bin/sh

if command -v jq > /dev/null; then
    cat /dev/stdin | json-eval | jq
elif command -v bat > /dev/null; then
    cat /dev/stdin | json-eval -p | bat -l javascript -p
else
    cat /dev/stdin | json-eval -p
fi
