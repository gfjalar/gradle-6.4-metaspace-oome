# Metaspace OOME reproduction

###### Commands (fixed in 6.5 nightly)

1. `bin/generate.sh 100`
1. `./gradlew clean assemble --no-build-cache --scan`


# --rerun-tasks issue reproduction [FIXED](https://github.com/gfjalar/gradle-6.4-metaspace-oome/pull/1)

1. `./gradlew clean b:test --no-build-cache --scan`
1. `./gradlew b:test --rerun-tasks --scan`


# changing fork jvm args issue reproduction [FIXED](https://github.com/gfjalar/gradle-6.4-metaspace-oome/pull/1)

1. `./gradlew a:assemble --no-build-cache --scan`
1. `./gradlew b:test -PmaxMetaspaceSize=1g --no-build-cache --scan`
1. [FIX] `./gradlew a:clean b:test --no-build-cache -PmaxMetaspaceSize=1g --scan`
