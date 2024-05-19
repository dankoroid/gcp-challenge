FROM amazoncorretto:17.0.11

VOLUME /tmp
EXPOSE 8080

COPY build/libs/*.jar app.jar
ENTRYPOINT ["java", "-jar", "app.jar"]