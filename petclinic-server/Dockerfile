from adoptopenjdk/openjdk11:alpine as build

run apk add curl bash vim unzip git
run curl https://downloads.apache.org/maven/maven-3/3.6.3/binaries/apache-maven-3.6.3-bin.tar.gz -o mvn.tar.gz
run tar -xzf mvn.tar.gz

env M2_HOME=apache-maven-3.6.3
env JAVA_HOME=/opt/java/openjdk/
env PATH=$PATH:/$M2_HOME/bin

run git clone https://github.com/spring-petclinic/spring-petclinic-rest.git
run cd spring-petclinic-rest && \
    sed -i 's/localhost/db/' src/main/resources/application-postgresql.properties && \
    sed -i 's/localhost/db/' src/main/resources/application-mysql.properties && \
    sed -i 's/hsqldb/postgresql/' src/main/resources/application.properties && \
    sed -i 's/false/true/' src/main/resources/application.properties && \
    mvn clean package -DskipTests

from adoptopenjdk/openjdk11:alpine
copy --from=build /spring-petclinic-rest/target/spring-petclinic-rest-2.2.5.jar /
cmd ["java", "-jar", "spring-petclinic-rest-2.2.5.jar"]
