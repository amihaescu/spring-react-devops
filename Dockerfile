FROM java:8
RUN mkdir -p /usr/app
COPY target/spring-react-0.0.1-SNAPSHOT.jar /usr/app
WORKDIR /usr/app
ENTRYPOINT ["java","-jar", "spring-react-0.0.1-SNAPSHOT.jar"]
EXPOSE 9000