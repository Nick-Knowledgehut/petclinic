build:
	docker build --tag bryandollery/petclinic-pipeline-engine .

run:
	docker run -it --rm -v /var/run/docker.sock:/var/run/docker.sock -v $$(pwd):/work -w /work bryandollery/petclinic-pipeline-engine

push:
	docker push bryandollery/petclinic-pipeline-engine
