FROM public.ecr.aws/amazoncorretto/amazoncorretto:24-jdk
VOLUME /tmp
COPY target/demo-0.0.1-SNAPSHOT.jar app.jar
ENTRYPOINT ["java","-jar","/app.jar"]