# Build stage
FROM gradle:7.4.0-jdk17 AS builder
WORKDIR /home/gradle/src

# Copy local code to the container image.
COPY . .

RUN gradle bootJar --no-daemon

FROM openjdk:17-jdk-alpine

ARG JAR_FILE=/home/gradle/src/build/libs/*.jar
COPY --from=builder ${JAR_FILE} app.jar

EXPOSE 8080
CMD ["java","-jar","/app.jar"]