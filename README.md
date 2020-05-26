# Metaspace OOME reproduction

###### Commands

1. `bin/generate.sh 100`
1. `./gradlew clean assemble --no-build-cache --scan`


# --rerun-tasks issue reproduction

1. `./gradlew clean b:test --no-build-cache --scan`
1. `./gradlew b:test --rerun-tasks --scan`


# changing fork jvm args issue reproduction

1. `./gradlew a:assemble --no-build-cache --scan`
1. `./gradlew b:test -PmaxMetaspaceSize=1g --no-build-cache --scan`
1. [FIX] `./gradlew a:clean b:test --no-build-cache -PmaxMetaspaceSize=1g --scan`
