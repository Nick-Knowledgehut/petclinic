# Petclinic
## Spring-petclinic-rest and spring-petclinic-angular in dockerfiles

https://github.com/spring-petclinic/spring-petclinic-angular

https://github.com/spring-petclinic/spring-petclinic-rest

This uses the standard linux 'make' system. Requires docker and make, nothing else. You don't even need that really, because in the root of this repo is a Dockerfile that can build and run both of these for you without having make installed on the host system. As always, docker is all you really need to get anything done:

docker run -it --rm -v /var/run/docker.sock:/var/run/docker.sock bryandollery/petclinic

That command pulls a container from docker-hub and runs it, sharing the docker-socket so that it can issue docker commands. It then downloads this repo, pulls the two images from docker, and runs them together using docker-compose. If you do this instead:

docker run -it --rm -v /var/run/docker.sock:/var/run/docker.sock bryandollery/petclinic cbuild

It'll build these containers locally for you, then run the two container using docker-compose
