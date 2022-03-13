FROM openjdk:11-jre-slim-buster

RUN apt update && apt install -y curl
ARG JAR_FILE=target/*.jar
COPY ${JAR_FILE} app.jar

EXPOSE 8098

ENTRYPOINT ["java","-jar","/app.jar"]
HEALTHCHECK --interval=25s CMD curl --fail http://localhost:8098/check || exit 1