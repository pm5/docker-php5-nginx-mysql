PWD=`pwd`

.PHONY: build test run start stop clean

build:
	docker build --rm=true -t pomin5/php5-nginx .

test:
	docker run -it --rm=true -p 8080:80 --name php5-nginx -v $(PWD):/app pomin5/php5-nginx /bin/bash

run:
	docker run -d -p 8080:80 --name=php5-nginx -v $(PWD):/app pomin5/php5-nginx

start:
	docker start php5-nginx

stop:
	docker stop php5-nginx

clean:
	docker rm -f php5-nginx || true
