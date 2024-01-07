build: # Build docker image according to the description in the book and some customizations.
	docker image build -t linux-in-practice-2nd-docker .

run: # Run docker container mounting the current directory to `/linux-in-practice-2nd/bind-mounts` directory in the container.
	docker run -it -p 5050:5050 -v $(PWD):/linux-in-practice-2nd/bind-mounts linux-in-practice-2nd-docker /bin/bash


