from bryandollery/maven-repo as build

run ls && git clone https://github.com/bryandollery/spring-petclinic-rest.git

run cd /root/spring-petclinic-rest && \
    mvn clean package -DskipTests

from adoptopenjdk/openjdk11:alpine

copy --from=build /root/spring-petclinic-rest/target/spring-petclinic-rest-2.3.0.jar /

cmd ["java", "-Dspring.profiles.active=postgresql", "-Dspring.datasource.url=jdbc:postgresql://petclinic-db:5432/petclinic", "-jar", "spring-petclinic-rest-2.3.0.jar"]
