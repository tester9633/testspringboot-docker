#
# Build stage
#
FROM maven
COPY src /home/app/src
COPY pom.xml /home/app
RUN mvn -f /home/app/pom.xml clean package

#
# Package stage
#
FROM openjdk
COPY --from=build /home/app/target/Docker-Test-0.0.1-SNAPSHOT.jar /usr/local/lib/Docker-Test.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","/usr/local/lib/Docker-Test.jar"]