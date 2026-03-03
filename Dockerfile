FROM eclipse-temurin:17-jdk-alpine AS build

WORKDIR /app
COPY . .

RUN apk add --no-cache maven
RUN mvn package

FROM eclipse-temurin:17-jdk-alpine

WORKDIR /app
COPY --from=build /app/target/*.jar app.jar

EXPOSE 8080
CMD ["java", "-jar", "app.jar"]