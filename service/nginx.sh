#!/bin/bash

mkdir -p /var/log/nginx
chown -R www-data:www-data /etc/nginx /var/log/nginx
exec /usr/sbin/nginx
