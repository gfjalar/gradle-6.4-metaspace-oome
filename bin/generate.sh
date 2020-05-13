#!/bin/bash

echo "Usage: bin/generate.sh [# of subprojects]"

BIN_DIR=`dirname "${BASH_SOURCE[0]}"`
ROOT_DIR=`dirname "$BIN_DIR"`
GENERATED_DIR="$ROOT_DIR/generated"

rm -rf "$GENERATED_DIR"
mkdir "$GENERATED_DIR"

pushd "$ROOT_DIR"

for subproject in $(seq -w 1 $1); do
  cp -r template "$GENERATED_DIR/subproject$subproject"
done

popd

echo "Generated $1 subprojects"
