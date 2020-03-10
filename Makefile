# This Makefile is meant to be used by people that do not usually work
# with Go source code. If you know what GOPATH is then you probably
# don't need to bother with make.

.PHONY: gee android ios gee-cross swarm evm all test clean
.PHONY: gee-linux gee-linux-386 gee-linux-amd64 gee-linux-mips64 gee-linux-mips64le
.PHONY: gee-linux-arm gee-linux-arm-5 gee-linux-arm-6 gee-linux-arm-7 gee-linux-arm64
.PHONY: gee-darwin gee-darwin-386 gee-darwin-amd64
.PHONY: gee-windows gee-windows-386 gee-windows-amd64

GOBIN = $(shell pwd)/build/bin
GO ?= latest

gee:
	build/env.sh go run build/ci.go install ./cmd/gee
	@echo "Done building."
	@echo "Run \"$(GOBIN)/gee\" to launch gee."

swarm:
	build/env.sh go run build/ci.go install ./cmd/swarm
	@echo "Done building."
	@echo "Run \"$(GOBIN)/swarm\" to launch swarm."

all:
	build/env.sh go run build/ci.go install

android:
	build/env.sh go run build/ci.go aar --local
	@echo "Done building."
	@echo "Import \"$(GOBIN)/gee.aar\" to use the library."

ios:
	build/env.sh go run build/ci.go xcode --local
	@echo "Done building."
	@echo "Import \"$(GOBIN)/Geth.framework\" to use the library."

test: all
	build/env.sh go run build/ci.go test

lint: ## Run linters.
	build/env.sh go run build/ci.go lint

clean:
	rm -fr build/_workspace/pkg/ $(GOBIN)/*

# The devtools target installs tools required for 'go generate'.
# You need to put $GOBIN (or $GOPATH/bin) in your PATH to use 'go generate'.

devtools:
	env GOBIN= go get -u golang.org/x/tools/cmd/stringer
	env GOBIN= go get -u github.com/kevinburke/go-bindata/go-bindata
	env GOBIN= go get -u github.com/fjl/gencodec
	env GOBIN= go get -u github.com/golang/protobuf/protoc-gen-go
	env GOBIN= go install ./cmd/abigen
	@type "npm" 2> /dev/null || echo 'Please install node.js and npm'
	@type "solc" 2> /dev/null || echo 'Please install solc'
	@type "protoc" 2> /dev/null || echo 'Please install protoc'

# Cross Compilation Targets (xgo)

gee-cross: gee-linux gee-darwin gee-windows gee-android gee-ios
	@echo "Full cross compilation done:"
	@ls -ld $(GOBIN)/gee-*

gee-linux: gee-linux-386 gee-linux-amd64 gee-linux-arm gee-linux-mips64 gee-linux-mips64le
	@echo "Linux cross compilation done:"
	@ls -ld $(GOBIN)/gee-linux-*

gee-linux-386:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --targets=linux/386 -v ./cmd/gee
	@echo "Linux 386 cross compilation done:"
	@ls -ld $(GOBIN)/gee-linux-* | grep 386

gee-linux-amd64:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --targets=linux/amd64 -v ./cmd/gee
	@echo "Linux amd64 cross compilation done:"
	@ls -ld $(GOBIN)/gee-linux-* | grep amd64

gee-linux-arm: gee-linux-arm-5 gee-linux-arm-6 gee-linux-arm-7 gee-linux-arm64
	@echo "Linux ARM cross compilation done:"
	@ls -ld $(GOBIN)/gee-linux-* | grep arm

gee-linux-arm-5:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --targets=linux/arm-5 -v ./cmd/gee
	@echo "Linux ARMv5 cross compilation done:"
	@ls -ld $(GOBIN)/gee-linux-* | grep arm-5

gee-linux-arm-6:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --targets=linux/arm-6 -v ./cmd/gee
	@echo "Linux ARMv6 cross compilation done:"
	@ls -ld $(GOBIN)/gee-linux-* | grep arm-6

gee-linux-arm-7:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --targets=linux/arm-7 -v ./cmd/gee
	@echo "Linux ARMv7 cross compilation done:"
	@ls -ld $(GOBIN)/gee-linux-* | grep arm-7

gee-linux-arm64:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --targets=linux/arm64 -v ./cmd/gee
	@echo "Linux ARM64 cross compilation done:"
	@ls -ld $(GOBIN)/gee-linux-* | grep arm64

gee-linux-mips:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --targets=linux/mips --ldflags '-extldflags "-static"' -v ./cmd/gee
	@echo "Linux MIPS cross compilation done:"
	@ls -ld $(GOBIN)/gee-linux-* | grep mips

gee-linux-mipsle:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --targets=linux/mipsle --ldflags '-extldflags "-static"' -v ./cmd/gee
	@echo "Linux MIPSle cross compilation done:"
	@ls -ld $(GOBIN)/gee-linux-* | grep mipsle

gee-linux-mips64:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --targets=linux/mips64 --ldflags '-extldflags "-static"' -v ./cmd/gee
	@echo "Linux MIPS64 cross compilation done:"
	@ls -ld $(GOBIN)/gee-linux-* | grep mips64

gee-linux-mips64le:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --targets=linux/mips64le --ldflags '-extldflags "-static"' -v ./cmd/gee
	@echo "Linux MIPS64le cross compilation done:"
	@ls -ld $(GOBIN)/gee-linux-* | grep mips64le

gee-darwin: gee-darwin-386 gee-darwin-amd64
	@echo "Darwin cross compilation done:"
	@ls -ld $(GOBIN)/gee-darwin-*

gee-darwin-386:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --targets=darwin/386 -v ./cmd/gee
	@echo "Darwin 386 cross compilation done:"
	@ls -ld $(GOBIN)/gee-darwin-* | grep 386

gee-darwin-amd64:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --targets=darwin/amd64 -v ./cmd/gee
	@echo "Darwin amd64 cross compilation done:"
	@ls -ld $(GOBIN)/gee-darwin-* | grep amd64

gee-windows: gee-windows-386 gee-windows-amd64
	@echo "Windows cross compilation done:"
	@ls -ld $(GOBIN)/gee-windows-*

gee-windows-386:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --targets=windows/386 -v ./cmd/gee
	@echo "Windows 386 cross compilation done:"
	@ls -ld $(GOBIN)/gee-windows-* | grep 386

gee-windows-amd64:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --targets=windows/amd64 -v ./cmd/gee
	@echo "Windows amd64 cross compilation done:"
	@ls -ld $(GOBIN)/gee-windows-* | grep amd64
