build:
	DOCKER_BUILDKIT=1 docker-compose build
up:
	docker-compose up -d

down:
	docker-compose down

clean:
	docker rm -f $(docker ps -qa)

logs:
	docker-compose logs -f
