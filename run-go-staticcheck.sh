#!/usr/bin/env bash

set -eu -o pipefail

if ! command -v staticcheck &> /dev/null ; then
	echo "staticcheck not installed or available in the PATH" >&2
	echo "please check https://github.com/dominikh/go-tools" >&2
	exit 1
fi

for DIR in $(echo "$@"|xargs -n1 dirname|sort -u); do
	staticcheck ./"$DIR"
done
