build:
	docker build --tag bryandollery/petclinic-testing-newman .

run:
	docker run -it --rm --network=petclinic_default -v $$(pwd):/work -w /work bryandollery/petclinic-testing-newman bash

