NAME = pomin5/php5-nginx
VERSION = 0.1.0

.PHONY: build test

build:
	docker build --rm -t $(NAME):$(VERSION) .

test:
	docker run -it --rm -p 8080:80 \
	 	-v $(PWD)/public:/var/www \
	 	-v $(PWD)/log/nginx:/var/log/nginx \
	 	-v $(PWD)/log/php5:/var/log/php5 \
	 	$(NAME):$(VERSION) /bin/bash
