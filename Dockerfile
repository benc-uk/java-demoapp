#
# Compile, build and package as JAR with Maven
#

FROM openjdk:11-jdk-slim-buster AS build

WORKDIR /build
 
COPY .mvn ./.mvn
COPY mvnw ./mvnw
COPY pom.xml .
COPY src ./src
RUN ./mvnw clean package

#
# Runtime image just has the fat JAR and not much else
#

FROM openjdk:11-jre-slim-buster

WORKDIR /app
 
COPY --from=build /build/target/java-demoapp-0.0.1.jar .
 
EXPOSE 8080 8081
 
ENTRYPOINT ["java", "-jar", "java-demoapp-0.0.1.jar"]
