FROM openjdk:8-slim as build

WORKDIR /appsi
COPY spring-example-project .
RUN ./mvnw package

FROM openjdk:8-jre-slim-buster
COPY --from=build /appsi/target/docker-example-1.1.3.jar .
RUN adduser --disabled-password appsi
USER appsi
CMD java -jar docker-example-1.1.3.jar
