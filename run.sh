#!/bin/bash

mkdir -f /app/log /app/public
/etc/init.d/php5-fpm start
/etc/init.d/nginx start     # daemon off
