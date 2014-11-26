PWD=`pwd`

.PHONY: build test run

build:
	docker build --rm=true -t pomin5/drupal7 .

test:
	docker run -it --rm=true -p 8080:80 --name drupal7 -v $(PWD):/app pomin5/drupal7 /bin/bash

run:
	docker run -d -p 8080:80 -v $(PWD):/app pomin5/drupal7
