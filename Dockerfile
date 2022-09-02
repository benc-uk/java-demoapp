#
# Compile, build and package as single 'fat' JAR with Maven
#
FROM adoptopenjdk/openjdk16:alpine AS build

ARG APP_VERSION=0.0.0

LABEL Name="Java SpringBoot Demo App" Version=$APP_VERSION
LABEL org.opencontainers.image.source = "https://github.com/pietervincken/renovate-talk-java-demo-app.git"

WORKDIR /build 
COPY .mvn ./.mvn
COPY mvnw ./mvnw
COPY pom.xml .
COPY src ./src

RUN ./mvnw -ntp clean package -Dapp.version=$APP_VERSION -DskipTests -Dmaven.test.skip=true -Dcheckstyle.skip=true
RUN mv target/java-demoapp-${APP_VERSION}.jar target/java-demoapp.jar

#
# Runtime image is just JRE + the fat JAR
#

FROM adoptopenjdk/openjdk16:alpine-jre

WORKDIR /app
COPY --from=build /build/target/java-demoapp.jar .

EXPOSE 8080
ENTRYPOINT ["java", "-jar", "java-demoapp.jar"]

