default: build 

branch := $(shell git rev-parse --abbrev-ref HEAD)	
branch := $(shell echo $(branch) | perl -pe 's/\//-/g')
branch := $(shell echo -$(branch))
branch := $(shell echo $(branch) | perl -pe 's/-master//')

run:
	./docker-msvc-wine

build: Dockerfile
	docker build -t boberfly/docker-msvc-wine$(branch) . 
