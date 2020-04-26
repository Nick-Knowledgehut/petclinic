from alpine

run apk add docker docker-compose make bash git

run git clone https://github.com/BryanDollery/petclinic

workdir /petclinic

env DOCKER_BUILDKIT=1

entrypoint ["/usr/bin/make"]

cmd ["petclinic"]
