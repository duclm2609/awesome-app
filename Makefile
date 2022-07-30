.PHONY: build run push

ifndef TAG
$(error TAG is not set)
endif

build:
	@docker build -t duclm2609/awesome-app:$(TAG) .

run: build
	@docker run --rm -d \
		--name awesome-app \
		-e AWESOMEAPP_VERSION=0.0.1 \
		-p 8080:8080 \
		duclm2609/awesome-app:$(TAG)

push:
	@docker push duclm2609/awesome-app:$(TAG)