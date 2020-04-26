.ONESHELL:
SHELL = /bin/bash

build: build-dc build-pc

petclinic: pull up

build-dc:
	DOCKER_BUILDKIT=1 docker-compose build

build-pc:
	DOCKER_BUILDKIT=1 docker build --tag bryandollery/petclinic .

pull:
	docker pull bryandollery/petclinic
	docker pull bryandollery/petclinic-server
	docker pull bryandollery/petclinic-client

run:
	docker run -it --rm -v /var/run/docker.sock:/var/run/docker.sock bryandollery/petclinic up

up:
	docker-compose up -d

down:
	docker-compose down

clean:
	docker rm -f $(docker ps -qa)

logs:
	docker-compose logs -f
