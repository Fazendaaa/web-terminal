REPO_OWNER:=rabchev
PROJECT:=web-terminal
MULTIARCH:=false
ARCHS:=linux/amd64
VERSION:=latest
ALPINE:=false
ifeq (true, $(MULTIARCH))
	ARCHS:=linux/amd64,linux/arm/v6,linux/arm/v7,linux/arm64/v8,linux/ppc64le,linux/s390x
endif

all: setup build

setup:
	@./buildx.sh
build:
	docker buildx build \
	$(ENV) \
	--platform $(ARCHS) \
	--push --tag $(REPO_OWNER)/$(PROJECT):$(VERSION) .
