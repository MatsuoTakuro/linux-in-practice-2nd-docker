build: # Build docker image according to the description in the book and some customizations.
	docker compose -f compose.yml build

run: # Run docker container according to the description in the book and some customizations.
	docker compose -f compose.yml up -d

in: # Enter the container.
	docker exec -it linux-in-practice-container /bin/bash

stop: # Stop the container.
	docker compose -f compose.yml down
