STACK_NAME		:= $(shell basename "$$(pwd)")
ENVIRONMENT		:= production

export ENVIRONMENT

.PHONY: all clean build deploy
.DEFAULT: all

all: clean build deploy

clean:
	@docker image ls | awk '/$(STACK_NAME)/ { system("docker image rm "$$3) }'

build:
	@docker build -t $(STACK_NAME):latest .

deploy:
	@docker run --rm -ti --name=$(STACK_NAME) $(STACK_NAME):latest
