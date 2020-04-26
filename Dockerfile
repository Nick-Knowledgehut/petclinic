from alpine

run apk add docker docker-compose make bash

copy ./ /petclinic/

workdir /petclinic

env DOCKER_BUILDKIT=1

entrypoint ["/bin/bash", "-c", "make"]
cmd ["up"]
