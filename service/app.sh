#!/bin/bash

if [ ! -f /home/app/password.txt ]; then
  chown -R app:www-data /var/www
  chmod 755 /var/www
  ln -s /var/www /home/app/public
  pwgen 16 1 > /home/app/password.txt
  chown app:www-data /home/app/password.txt
  echo app:$(cat /home/app/password.txt) | chpasswd
fi
