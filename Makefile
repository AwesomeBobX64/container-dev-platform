install: install/docker

install/brew:
	@./scripts/install-brew.sh

install/docker: install/brew
	@./scripts/install-docker.sh

build/all:
	@./scripts/build-all.sh
