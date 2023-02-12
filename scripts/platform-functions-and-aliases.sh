# Run a local docker container
docker_run_local() {
  docker run -it --rm -v "$(pwd):/app" -w /app $@
}

# Run node as a local docker container
node_run_local() {
  docker_run_local -v "$HOME/.npm:/root/.npm" node:dev $@
}

alias node="node_run_local node"
alias npm="node_run_local npm"
alias yarn="node_run_local yarn"