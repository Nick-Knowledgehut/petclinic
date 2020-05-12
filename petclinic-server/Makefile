build:
	DOCKER_BUILDKIT=1 docker build --build-arg rebuild=$$RANDOM --tag bryandollery/petclinic-server .

run:
	docker run -it --rm --name petclinic-server -p 8080:9966 -d bryandollery/petclinic-server 

debug:
	docker exec -it petclinic-server sh

logs:
	docker logs petclinic-server

follow:
	docker logs -f petclinic-server

stop:
	docker stop petclinic-server

clean:
	docker rm petclinic-server

curl:
	curl -sS localhost:8080/petclinic/api/vets | jq '.'
