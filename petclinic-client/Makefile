build:
	DOCKER_BUILDKIT=1 docker build --tag bryandollery/petclinic-client .

run:
	docker run -it --name petclinic-client -p 8081:8400 -d bryandollery/petclinic-client

join:
	docker exec -it petclinic-client sh

debug:
	docker run -it --rm --name petclinic-client -p 8081:4200 bryandollery/docker-spring-petclinic-angular bash

logs:
	docker logs petclinic-client

follow:
	docker logs -f petclinic-client

stop:
	docker stop petclinic-client

clean:
	docker rm petclinic-client
