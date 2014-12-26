#!/bin/bash

/init.sh
/etc/init.d/php5-fpm start
/etc/init.d/nginx start     # daemon off
