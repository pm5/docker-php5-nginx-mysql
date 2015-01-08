#!/bin/bash

/usr/sbin/php5-fpm && tail -f /var/log/php5-fpm.log
