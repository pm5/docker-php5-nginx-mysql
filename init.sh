#!/bin/bash

if [ ! -f /app/password.txt ]; then
  pwgen 16 1 > /root/password.txt
  chmod 600 /root/password.txt

  pwgen 16 1 > /app/password.txt
  chown app:app /app/password.txt
  chmod 600 /app/password.txt
fi

echo root:$(cat /root/password.txt) | chpasswd
echo app:$(cat /app/password.txt) | chpasswd
usermod -aG sudo app
