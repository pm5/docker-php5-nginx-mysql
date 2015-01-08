NAME = pomin5/php5-nginx
VERSION = 0.1.1

.PHONY: build test run

build:
	docker build --rm -t $(NAME):$(VERSION) .

test:
	docker run -it --rm \
		-p 8080:80 -p 2222:22 -p 2020:20 -p 2121:21 \
	 	-v $(PWD):/var/www \
	 	-v $(PWD)/.run/log:/var/log \
	 	$(NAME):$(VERSION) /bin/bash

run:
	docker run -dt \
		-p 8080:80 -p 2222:22 -p 2020:20 -p 2121:21 \
	 	-v $(PWD):/var/www \
	 	-v $(PWD)/.run/log:/var/log \
	 	$(NAME):$(VERSION)
