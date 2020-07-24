#!/bin/bash

set -o nounset
set -o errexit

if [[ $# != 1 ]]; then
    echo >&2 "usage: $0 X.Y.Z"
    exit 64
fi
VERSION=$1

brew install --build-bottle ./Formula/gn
brew bottle --root-url="https://github.com/sfiera/homebrew-gn/releases/download/v$VERSION/" gn
