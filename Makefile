NAME = pomin5/php5-nginx
VERSION = 0.1.0

.PHONY: build test

build:
	docker build --rm -t $(NAME):$(VERSION) .

test:
	docker run -it --rm \
		-p 8080:80 -p 2222:22 -p 2020:20 -p 2121:21 \
	 	-v $(PWD)/public:/var/www \
	 	-v $(PWD)/log/nginx:/var/log/nginx \
	 	-v $(PWD)/log/php5:/var/log/php5 \
	 	-v $(PWD)/log/vsftpd:/var/log/vsftpd \
	 	$(NAME):$(VERSION) /bin/bash
