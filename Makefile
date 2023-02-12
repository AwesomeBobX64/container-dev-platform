.PHONY: install

install/brew:
	@./scripts/install-brew.sh

install/docker: install/brew
	@./scripts/install-docker.sh

build/all: install/docker
	@./scripts/build-all-images.sh

install/all: build/all
	@./scripts/install-functions-and-aliases.sh

install: install/all
