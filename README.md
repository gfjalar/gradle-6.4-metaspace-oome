# Metaspace OOME reproduction

###### Commands

1. `bin/generate.sh 100`
1. `./gradlew clean assemble --no-build-cache --scan`


# testImplementation issue reproduction

1. `./gradlew clean b:test --no-build-cache --scan`
1. `./gradlew b:test --rerun-tasks --scan`
