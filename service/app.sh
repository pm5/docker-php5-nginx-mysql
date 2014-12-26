#!/bin/bash

if [ ! -f /app/password.txt ]; then
  chown -R app:www-data /var/www
  chmod 755 /var/www
  pwgen 16 1 > /app/password.txt
  echo app:$(cat /app/password.txt) | chpasswd
fi
