#
# Compile, build and package as single 'fat' JAR with Maven
#
#FROM openjdk:11-jdk-slim-buster AS build
FROM adoptopenjdk/openjdk11:alpine AS build

ARG APP_VERSION=1.0.2

WORKDIR /build 
COPY .mvn ./.mvn
COPY mvnw ./mvnw
COPY pom.xml .
COPY src ./src

RUN ./mvnw -ntp clean package -Dapp.version=$APP_VERSION -DskipTests -Dmaven.test.skip=true
RUN mv target/java-demoapp-${APP_VERSION}.jar target/java-demoapp.jar

#
# Runtime image is just JRE + the fat JAR
#

#FROM openjdk:11-jre-slim-buster
FROM adoptopenjdk/openjdk11:alpine-jre

WORKDIR /app
COPY --from=build /build/target/java-demoapp.jar .
 
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "java-demoapp.jar"]
