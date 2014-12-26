#!/bin/bash

chown -R www-data:www-data /etc/nginx /var/log/nginx
ln -s /var/www /app/public
exec /usr/sbin/nginx
