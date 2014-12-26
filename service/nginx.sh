#!/bin/bash

chown -R www-data:www-data /etc/nginx /var/log/nginx
exec /usr/sbin/nginx
