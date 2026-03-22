# ci_java_builder
Creating a Docker container image suitable for building Java applications in a CI environment.

## Design decisions
- `eclipse-temurin:21-jdk-alpine` — minimal base image with Java 21
- Gradle dependencies pre-cached at build time — fast CI run
- Non-root user `ci` by default — better security for CI

## How to build
```
docker build -t ci-java-builder .
docker run -v $(pwd)/test_java_project:/workspace ci-java-builder gradle build
```

## How to test locally
Run from your Java project directory:   
As non-root user
```
docker run -v $(pwd)/test_java_project:/workspace ci-java-builder java -jar /workspace/build/libs/workspace-1.0.jar
```
As root:
```
docker run -u root -v $(pwd)/test_java_project:/workspace ci-java-builder java -jar /workspace/build/libs/workspace-1.0.jar
```
