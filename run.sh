#!/bin/bash

mkdir -p /app/log /app/public
chown app:app /app/log
chown app:www-data /app/public
/etc/init.d/php5-fpm start
/etc/init.d/nginx start     # daemon off
