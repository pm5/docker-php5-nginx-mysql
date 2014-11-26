FROM debian:wheezy
MAINTAINER Pomin Wu <pomin5@gmail.com>
ENV DEBIAN_FRONTEND noninteractive
ENV REFRESHED_AT 2014-11-26

RUN apt-get update && \
    apt-get install -yq php5 php5-fpm php-pear php5-gd php5-curl php5-sqlite php5-mysql php5-pgsql && \
    apt-get install -yq nginx-full && \
    apt-get install -yq mysql-client unzip curl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN echo "daemon off;" >> /etc/nginx/nginx.conf
ADD sites-enabled/ /etc/nginx/sites-enabled/

RUN sed -i 's/memory_limit = 128M/memory_limit = 256M/' /etc/php5/fpm/php.ini
RUN sed -i 's/error_log = \/var\/log\/php5-fpm.log/error_log = \/app\/log\/php5-fpm.log/' /etc/php5/fpm/php-fpm.conf

VOLUME ["/app"]

EXPOSE 80
