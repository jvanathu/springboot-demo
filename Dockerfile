FROM maven:3.6.0-jdk-11-slim AS build
COPY pom.xml /app/pom.xml
COPY src /app/src
RUN mvn clean package

FROM openjdk:11-jdk
WORKDIR /app
COPY --from=build /app/target/*.jar /app.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","app.jar"]
