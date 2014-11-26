PWD=`pwd`

.PHONY: build test

build:
	docker build --rm=true -t pomin5/drupal7 .

test:
	docker run -it --rm=true -p 8080:80 --name drupal7 -v $(PWD):/app pomin5/drupal7 /bin/bash
