DOCKERNAME=jonathanhood/battleline
DOCKERVERSION=latest

.PHONY: build
build:
	docker build --no-cache -t ${DOCKERNAME}:${DOCKERVERSION} .

.PHONY: run
run:
	docker run -it ${DOCKERNAME}:${DOCKERVERSION}

.PHONY: shell
shell:
	docker run -it ${DOCKERNAME}:${DOCKERVERSION} /bin/bash

.PHONY: help
help:
	@echo "-------------------------------------------------------------------------------"
	@echo "  make build   --> Build a new container"
	@echo "  make run     --> Run the container"
	@echo "  make shell   --> Open a shell in the container"
	@echo "-------------------------------------------------------------------------------"

.DEFAULT_GOAL := help

