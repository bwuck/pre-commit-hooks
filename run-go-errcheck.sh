#!/usr/bin/env bash

set -eu -o pipefail

if ! command -v errcheck &> /dev/null ; then
	echo "errcheck not installed or available in the PATH" >&2
	echo "please check https://github.com/kisielk/errcheck" >&2
	exit 1
fi

for DIR in $(echo "$@"|xargs -n1 dirname|sort -u); do
	errcheck ./"$DIR"
done
