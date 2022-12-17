#!/usr/bin/env bash

set -eu -o pipefail

for DIR in $(echo "$@"|xargs -n1 dirname|sort -u); do
	go vet ./"$DIR"
done
