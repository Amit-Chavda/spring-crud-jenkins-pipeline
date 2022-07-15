FROM openjdk:11
EXPOSE 8081
ADD target/*.jar UserRestAPI-0.0.1-SNAPSHOT.jar
ENTRYPOINT ["java","-jar","/UserRestAPI-0.0.1-SNAPSHOT.jar"]