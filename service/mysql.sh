#!/bin/bash

LOG="/var/log/mysql/error.log"

StartMySQL ()
{
  /usr/bin/mysqld_safe > /dev/null 2>&1 &

  # Time out in 1 minute
  LOOP_LIMIT=13
  for (( i=0 ; ; i++ )); do
    if [ ${i} -eq ${LOOP_LIMIT} ]; then
      echo "Time out. Error log is shown as below:"
      tail -n 100 ${LOG}
      exit 1
    fi
    echo "=> Waiting for confirmation of MySQL service startup, trying ${i}/${LOOP_LIMIT} ..."
    sleep 5
    cat /root/.my.cnf
    mysql -uroot -e "status" > /dev/null 2>&1 && break
  done
}

mkdir -p /var/log/mysql
StartMySQL

if [ ! -f /root/.my.cnf ]; then
  DB_ROOT_PASS=$(pwgen 16 1)
  cat > /root/.my.cnf <<END
[client]
password=$DB_ROOT_PASS
END
  echo "UPDATE user SET password=PASSWORD('$DB_ROOT_PASS') WHERE user = 'root'; FLUSH PRIVILEGES;" | mysql -u root mysql
fi

if [ ! -f /home/app/.my.cnf ]; then
  DB_PASS=$(pwgen 16 1)
  cat > /home/app/.my.cnf <<END
[client]
password=$DB_PASS
END
  chown app:www-data /home/app/.my.cnf
  mysqladmin -u root create app
  echo "GRANT all on app.* to app@localhost identified by '$DB_PASS'; FLUSH PRIVILEGES;" | mysql -u root mysql
fi
