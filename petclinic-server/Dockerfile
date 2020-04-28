from bryandollery/maven-repo as build

run git clone https://github.com/bryandollery/spring-petclinic-rest.git
run cd /root/spring-petclinic-rest && \
    mvn clean install

from adoptopenjdk/openjdk11:alpine
copy --from=build /root/spring-petclinic-rest/target/spring-petclinic-rest-2.3.0.jar /
cmd ["java", "-jar", "spring-petclinic-rest-2.3.0.jar"]
