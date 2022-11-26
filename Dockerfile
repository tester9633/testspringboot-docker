#
# Build stage
#
FROM 3.8.6-openjdk-18-slim
COPY src /home/app/src
COPY pom.xml /home/app
RUN mvn -f /home/app/pom.xml clean package

#
# Package stage
#
FROM openjdk
COPY /home/app/target/Docker-Test-0.0.1-SNAPSHOT.jar /usr/local/lib/Docker-Test-0.0.1-SNAPSHOT.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","/usr/local/lib/Docker-Test-0.0.1-SNAPSHOT.jar"]