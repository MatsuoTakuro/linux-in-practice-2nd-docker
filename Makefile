build: # Build docker image according to the description in the book and some customizations.
	docker image build -t linux-in-practice-2nd-docker .

run: # Run docker container mounting `./bind-mount` directory to `/linux-in-practice-2nd/bind-mount` directory in the container.
	docker run -it -v $(PWD)/bind-mount:/linux-in-practice-2nd/bind-mount linux-in-practice-2nd-docker /bin/bash


