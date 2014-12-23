
.PHONY: build test clean

build:
	docker build --rm -t pomin5/php5-nginx .

test:
	docker run -it --rm -p 8080:80 --name php5-nginx \
	 	-v $(PWD)/public:/var/www \
	 	-v $(PWD)/log/nginx:/var/log/nginx \
	 	-v $(PWD)/log/php5:/var/log/php5 \
	 	pomin5/php5-nginx /bin/bash

clean:
	docker rm -f php5-nginx || true
