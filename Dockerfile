FROM openjdk:17

WORKDIR /app

COPY mvnw .
COPY .mvn .mvn
COPY pom.xml .
COPY src src


RUN ./mvnw package -DskipTests

CMD java -jar target/*.jar
