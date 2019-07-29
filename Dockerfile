#
# Compile, build and package as single 'fat' JAR with Maven
#
FROM openjdk:11-jdk-slim-buster AS build

ARG APP_VERSION=3.5.6

WORKDIR /build 
COPY .mvn ./.mvn
COPY mvnw ./mvnw
COPY pom.xml .
COPY src ./src
RUN ./mvnw clean package -Dapp.version=$APP_VERSION
RUN mv target/java-demoapp-${APP_VERSION}.jar target/java-demoapp.jar

#
# Runtime image is just JRE + the fat JAR
#

FROM openjdk:11-jre-slim-buster

ARG APP_VERSION=3.5.6
ENV APP_VER=${APP_VERSION}
WORKDIR /app
COPY --from=build /build/target/java-demoapp.jar .
 
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "java-demoapp.jar"]
