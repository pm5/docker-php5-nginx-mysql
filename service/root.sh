#!/bin/bash

if [ ! -f /root/password.txt ]; then
  pwgen 16 1 > /root/password.txt
  echo root:$(cat /root/password.txt) | chpasswd
fi
