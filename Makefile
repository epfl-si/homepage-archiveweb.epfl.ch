# (c) ECOLE POLYTECHNIQUE FEDERALE DE LAUSANNE, Switzerland, 2022.

SHELL := /bin/bash

.PHONY: help
help:
	@echo "Main:"
	@echo "  make help             — Display this help"
	@echo "Local development:"
	@echo "  make build            — Build archiveweb for local development"
	@echo "  make build-force      — Force build archiveweb for local development"
	@echo "  make up               — Brings up archiveweb for local development"
	@echo "  make app-exec         — Enter the local development app container"

.PHONY: build
build:
	@docker-compose build

.PHONY: build-force
build-force:
	@docker-compose build --force-rm --no-cache --pull

.PHONY: up
up:
	@wget -P homepage/common/includes-web2018/ -N -nd -r -l 1 -e robots=off https://web2018.epfl.ch/download-me.html
	@wget -O homepage/archived-websites.json https://archiveweb.epfl.ch/archived-websites.json
	@docker-compose up

.PHONY: app-exec
app-exec:
	@docker exec -it --user nginx archiveweb-app sh
