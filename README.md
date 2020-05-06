# Petclinic
## [spring-petclinic-rest](https://github.com/spring-petclinic/spring-petclinic-rest) and [spring-petclinic-angular](https://github.com/spring-petclinic/spring-petclinic-angular) in dockerfiles
### For the training course: Automated Testing
This uses the standard linux 'make' system. Requires docker and make, nothing else. You don't even need that really, because in the root of this repo is a Dockerfile that can build and run both of these for you without having make installed on the host system. As always, docker is all you really need to get anything done:

```
docker run -it --rm -v /var/run/docker.sock:/var/run/docker.sock bryandollery/petclinic
```

That command pulls an image from hub.docker and runs it, sharing the docker-socket so that it can issue docker commands. The container then downloads this repo, pulls the other two petclinic images (client & server) from docker, and runs them together using docker-compose. If you do this instead:

```
docker run -it --rm -v /var/run/docker.sock:/var/run/docker.sock bryandollery/petclinic cbuild
```

Rather than pulling the containers from hub.docker, it will build these containers locally for you, then run the two container using docker-compose.

Other interesting commands include:
```
docker run -it --rm -v /var/run/docker.sock:/var/run/docker.sock bryandollery/petclinic up
```
Which runs the `docker-compose up -d` command to bring up the servers and
```
docker run -it --rm -v /var/run/docker.sock:/var/run/docker.sock bryandollery/petclinic down
```
Which runs the `docker-compose down` command to bring down the servers. While the servers are running you can run:
```
docker run -it --rm -v /var/run/docker.sock:/var/run/docker.sock bryandollery/petclinic logs
```
To view the logs via the `docker-compose logs -f` command.

These commands all override the `cmd` entry in the dockerfile (which defaults to `petclinic`). The default entrypoint
causes docker to run `make` in the container you're running, so these cmd overrides are all `make` targets.

If you'd like to get your hands a little more dirty with docker, you can always run bash in the PetClinic container like this:
```
docker run -it --rm -v /var/run/docker.sock:/var/run/docker.sock --entrypoint /bin/bash bryandollery/petclinic
```
Notice the `--entrypoint bash` argument. This overrides the default `entrypoint` to run `bash` rather than `make`. This 
will dump you straight into a bash terminal in the /petclinic directory. This directory contains a clone of this git repo.
From here you can try `make up`, or `make down`, or any of the other targets in the Makefile, or you can `cd` into the
subdirectories (one per server) to play around with those too. Feel free to edit the `Dockerfile` that sits in each directory,
but be aware that the next command should be, `make` or `make build`, to force make to rebuild the images you're using. You can 
follow that with `make up`. Docker compose will replace any running containers that you have changed.

The [PetClinic](http://localhost:8081/petclinic/index.html) is served locally on port 8081

---

## Testing The Pet Clinic
#### A Project for groups of 4 people


Our intent is to layer all the course's training tools into a full testing suite for this application. Start following this process:

1. Exploratory Testing
2. Define features and stories
3. Use Gherkin language to document the features and stories
    * As A, I Want, So That
    * Given, When, Then
4. Implement the Gherkin (cucumber) scripts using 
    * `Selenium's POM`, and 
    * `JUnit` with `maven`
    * Editing with `IntelliJ Idea`
    * Using `git` to keep track of your progress (and `github`)
5. Test the REST API with `Postman` (tests in `JS`)
6. Write Jenkins pipelines to run this in CI

Deliverables:
1. High level plan of action
2. Feature files
3. Junit/Selenium Tests for these features
4. Postman API tests running in a Newman container
5. Jenkins pipelines

Expectations
All in github -- 1 account per team
All running in containers


###### Notes:
You are *required* to use the tools listed here
* [Docker](https://www.docker.com/)
* [Docker compose](https://docs.docker.com/compose/)
* [IntelliJ Idea](https://www.jetbrains.com/idea/)
* [Git](https://git-scm.com/)
* [GitHub](https://github.com/)
* [DockerHub](https://hub.docker.com)
* [Maven](http://maven.apache.org/)
* [Selenium](https://github.com/SeleniumHQ/selenium)
* [AdoptOpenJDK Java-11](https://adoptopenjdk.net/)
* [make](https://www.gnu.org/software/make/)
* [Postman](https://postman.com/)   
* [Jenkins](https://jenkins.io)


Alternative tools are not really acceptable. More activities will be added
as we move through the course, including automation of testing
pipelines with Jenkins, and secure-coding static-analysis.

Each team will nominate 1 person to host the team's github repo.


