#
# Build stage
#
FROM maven
WORKDIR /usr/src/myapp
COPY . /usr/src/myapp/
# COPY pom.xml /home/app
RUN mvn -f /home/app/src/pom.xml clean package

#
# Package stage
#
FROM openjdk
COPY --from=build /usr/src/myapp/Docker-Test-0.0.1-SNAPSHOT.jar /usr/src/myapp/Docker-Test.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","/usr/src/myapp/Docker-Test.jar"]