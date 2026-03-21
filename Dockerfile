FROM eclipse-temurin:21-jdk-alpine
ENV GRADLE_USER_HOME=/gradle-home 
RUN apk add --no-cache gradle bash && \
	adduser -D -s /bin/bash ci && \
	mkdir -p /gradle-home && \
	chown ci:ci /gradle-home
COPY --chown=ci:ci build.gradle /home/ci/build.gradle
WORKDIR /home/ci
USER ci
RUN gradle dependencies --no-daemon
CMD ["gradle","build"]

