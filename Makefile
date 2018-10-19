#!make

#include .env
#export $(shell sed 's/=.*//' .env)

.SILENT:

SHELL := /bin/bash

## Colors
COLOR_RESET   = \033[0m
COLOR_INFO    = \033[32m
COLOR_COMMENT = \033[33m

## This help dialog
help:
	printf "${COLOR_COMMENT}Usage:${COLOR_RESET}\n"
	printf " make [target]\n\n"
	printf "${COLOR_COMMENT}Available targets:${COLOR_RESET}\n"
	awk '/^[a-zA-Z\-\_0-9\.@]+:/ { \
		helpMessage = match(lastLine, /^## (.*)/); \
		if (helpMessage) { \
			helpCommand = substr($$1, 0, index($$1, ":")); \
			helpMessage = substr(lastLine, RSTART + 3, RLENGTH); \
			printf " ${COLOR_INFO}%-16s${COLOR_RESET} %s\n", helpCommand, helpMessage; \
		} \
	} \
	{ lastLine = $$0 }' $(MAKEFILE_LIST)

## Start a development server
start@dev:
	hugo server -D

## Build the application
build:
	hugo

## Build x86_64 image
build@x86_64:
	sudo docker build . -f ./Dockerfile -t wolnosciowiec/zsp-umowy-smieciowe

## Build arm7hf image
build@arm7hf:
	sudo docker build . -f ./Dockerfile.arm7hf -t wolnosciowiec/zsp-umowy-smieciowe:arm7hf

## Push x86_64 image to registry
push@x86_64:
	sudo docker push wolnosciowiec/zsp-umowy-smieciowe

## Push arm7hf image to registry
push@arm7hf:
	sudo docker push wolnosciowiec/zsp-umowy-smieciowe:arm7hf

## Run the x86_64 image
run@x86_64:
	sudo docker run --rm --name zsp-umowy-smieciowe -p 80:80 wolnosciowiec/zsp-umowy-smieciowe
