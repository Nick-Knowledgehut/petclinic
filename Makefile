.ONESHELL:
SHELL = /bin/bash

build: build-petclinic-components build-petclinic-tools

petclinic: pull up

build-petclinic-components:
	DOCKER_BUILDKIT=1 docker-compose build

build-petclinic-tools:
	DOCKER_BUILDKIT=1 docker build --tag bryandollery/petclinic .

pull:
	docker pull bryandollery/petclinic
	docker pull bryandollery/petclinic-db
	docker pull bryandollery/petclinic-server
	docker pull bryandollery/petclinic-client

run:
	docker run -it --rm -v /var/run/docker.sock:/var/run/docker.sock bryandollery/petclinic

cbuild:
	docker run -it --rm -v /var/run/docker.sock:/var/run/docker.sock bryandollery/petclinic build

up:
	docker-compose up -d

down:
	docker-compose down

clean:
	docker rm -f $(docker ps -qa)

cleandb:
	docker volume rm petclinic-db

logs:
	docker-compose logs -f
