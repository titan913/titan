.PHONY: build cluster test

default: build

build:
	go build -o bin/swarm    github.com/William/gee/cmd/swarm
	go build -o bin/geth     github.com/William/gee/cmd/geth
	go build -o bin/bootnode github.com/William/gee/cmd/bootnode

cluster: build
	scripts/boot-cluster.sh

test:
	go test -v github.com/William/gee/swarm/...
