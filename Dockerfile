FROM phusion/baseimage:0.9.15
MAINTAINER Pomin Wu <pomin5@gmail.com>
ENV REFRESHED_AT 2014-12-26

ENV HOME /root
RUN /etc/my_init.d/00_regen_ssh_host_keys.sh
CMD ["/sbin/my_init"]

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && \
    apt-get install -yq pwgen && \
    apt-get install -yq php5 php5-fpm php-pear php5-gd php5-curl php5-sqlite php5-mysql php5-pgsql && \
    apt-get install -yq nginx-full && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

ADD mykey.pub /tmp/mykey.pub
RUN cat /tmp/mykey.pub >> /root/.ssh/authorized_keys && rm -f /tmp/mykey.pub
RUN mkdir /etc/service/root
ADD service/root.sh /etc/service/root/run

RUN echo "daemon off;" >> /etc/nginx/nginx.conf
RUN rm /etc/nginx/sites-enabled/default
ADD etc/nginx/sites-enabled /etc/nginx/sites-enabled/
RUN mkdir /etc/service/nginx
ADD service/nginx.sh /etc/service/nginx/run

RUN sed -i 's/memory_limit = 128M/memory_limit = 256M/' /etc/php5/fpm/php.ini
RUN mkdir /var/log/php5
RUN sed -i 's/error_log = \/var\/log\/php5-fpm.log/error_log = \/var\/log\/php5\/php5-fpm.log/' /etc/php5/fpm/php-fpm.conf
RUN mkdir /etc/service/php5-fpm
ADD service/php5-fpm.sh /etc/service/php5-fpm/run

VOLUME ["/var/www", "/var/log/nginx", "/var/log/php5"]
