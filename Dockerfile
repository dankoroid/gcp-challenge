# Build stage
FROM gradle:7.3.0-jdk17 AS build

WORKDIR /

RUN gradle bootJar --no-daemon

# Run stage
FROM amazoncorretto:17.0.11

VOLUME /tmp
EXPOSE 8080

COPY --from=build /build/libs/*.jar /app.jar

CMD ["java","-jar","/app.jar"]