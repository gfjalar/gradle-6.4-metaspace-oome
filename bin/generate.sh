#!/bin/bash

echo "Usage: bin/generate.sh [# of subprojects] [# of classes per subproject] [# of methods per class]"

BIN_DIR=`dirname "${BASH_SOURCE[0]}"`
ROOT_DIR=`dirname "$BIN_DIR"`
GENERATED_DIR="$ROOT_DIR/generated"

rm -rf "$GENERATED_DIR"
mkdir "$GENERATED_DIR"

BODY=""
for (( method=1; method <= $3; method++ )); do
  BODY="${BODY}N  def template$method(): Unit = { println(\"Template method #$method\") }N"
done

pushd "$ROOT_DIR"

for (( subproject=1; subproject <= $1; subproject++ )); do
  cp -r template "$GENERATED_DIR/subproject$subproject"
  pushd "$GENERATED_DIR/subproject$subproject/src/main/scala/gradle/metaspace/oome"

  sed -i '' "s|{}|{$BODY}|" "Template.scala"
  sed -i '' $'s/N/\\\n/g' "Template.scala"
  for (( class=1; class <= $2; class++ )); do
    cp "Template.scala" "Template$class.scala"
    sed -i '' "s|class Template {|class Template$class {|" "Template$class.scala"
  done

  rm "Template.scala"
  popd
done

popd

echo "Generated $1 subprojects with $2 classes per subproject and $3 methods per class"
