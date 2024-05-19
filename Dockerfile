ARG APP_PORT=18181
ARG BUILT_JAR_FILE="build/libs/GCP-challenge-app-1.0-SNAPSHOT.jar"
ARG RUNNABLE_JAR_FILE_NAME="app.jar"

FROM amazoncorretto:17.0.11

VOLUME /tmp
EXPOSE ${APP_PORT}

COPY ${BUILT_JAR_FILE} ${RUNNABLE_JAR_FILE_NAME}
ENTRYPOINT ["java", "-jar", "/${RUNNABLE_JAR_FILE_NAME}"]