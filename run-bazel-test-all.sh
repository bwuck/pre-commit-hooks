#!/usr/bin/env bash
# Runs all the bazel tests.

PASS=true

TOP_DIR=$(git rev-parse --show-toplevel)

pushd $TOP_DIR > /dev/null

bazel test ...

if [ "$?" -eq 1 ]; then
	PASS=false
fi

popd

if [ "$PASS" = "false" ]; then
	exit 1
fi
