#!/usr/bin/env bash
set -e

ORG_PATH="github.com/rkamudhan"
REPO_PATH="${ORG_PATH}/test2"

if [ ! -h gopath/src/${REPO_PATH} ]; then
	mkdir -p gopath/src/${ORG_PATH}
	ln -s ../../../.. gopath/src/${REPO_PATH} || exit 255
fi

export GO15VENDOREXPERIMENT=1
export GOBIN=${PWD}/bin
export GOPATH=${PWD}/gopath
export GO="${GO:-go}"

mkdir -p "${PWD}/bin"

echo "Building test"
BUILD="$GO build "$@" -o "${PWD}/bin/test" "$REPO_PATH"/test"
eval $BUILD
