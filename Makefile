# (c) ECOLE POLYTECHNIQUE FEDERALE DE LAUSANNE, Switzerland, 2022.

SHELL := /bin/bash

mkfile_path := $(abspath $(lastword $(MAKEFILE_LIST)))
mkfile_dir := $(dir $(mkfile_path))

HADOLINT_IMAGE = hadolint/hadolint
HADOLINT_VERSION = 2.12.0-alpine
HADOLINT_VLOCAL = -v ${mkfile_dir}:/host:ro
HADOLINT = @docker run --rm ${HADOLINT_VLOCAL} ${HADOLINT_IMAGE}:${HADOLINT_VERSION}

TRIVY_IMAGE = aquasec/trivy
TRIVY_VERSION = 0.35.0
TRIVY_VCACHE = -v /tmp/trivy/:/root/.cache/
TRIVY_VLOCAL = -v /var/run/docker.sock:/var/run/docker.sock
TRIVY = @docker run --rm ${TRIVY_VCACHE} ${TRIVY_VLOCAL} ${TRIVY_IMAGE}:${TRIVY_VERSION}

.PHONY: help
help:
	@echo "Main:"
	@echo "  make help             — Display this help"
	@echo "Utilities:"
	@echo "  make lint             — Lint code"
	@echo "  make scan             — Scan images for vulnerabilities"
	@echo "Local development:"
	@echo "  make build            — Build archiveweb for local development"
	@echo "  make build-force      — Force build archiveweb for local development"
	@echo "  make up               — Brings up archiveweb for local development"
	@echo "  make app-exec         — Enter the local development app container"
	@echo "  make job-exec         — Enter the local development job container"
	@echo "  make job-run          — Run job fill-archivedwebsites-json.js"

.PHONY: scan
scan:
	@${TRIVY} image --clear-cache
	@${TRIVY} image --severity HIGH,CRITICAL homepage-archivewebepflch_app:latest
	@${TRIVY} image --severity HIGH,CRITICAL homepage-archivewebepflch_job:latest

.PHONY: lint
lint:
	@${HADOLINT} sh -c "hadolint -c /host/.hadolint.yml /host/docker/*/Dockerfile"

.PHONY: build
build:
	@docker compose build

.PHONY: build-force
build-force:
	@docker compose build --force-rm --no-cache --pull

.PHONY: up
up:
	@wget -O homepage/archived-websites.json https://archiveweb.epfl.ch/archived-websites.json
	@docker compose up

.PHONY: app-exec
app-exec:
	@docker exec -it --user nginx archiveweb-app sh

.PHONY: job-exec
job-exec:
	@docker exec -it --user node archiveweb-job sh

.PHONY: job-run
job-run:
	@docker exec -it --user node archiveweb-job sh -c \
		"node /fill-archivedwebsites-json.js"
