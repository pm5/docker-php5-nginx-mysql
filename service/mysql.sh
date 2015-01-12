#!/bin/bash

mkdir -p /var/log/mysql

/usr/bin/mysqld_safe > /dev/null 2>&1 &
sleep 10s

if [ ! -f /root/.my.cnf ]; then
  DB_ROOT_PASS=$(pwgen 16 1)
  cat > /root/.my.cnf <<END
[client]
password=$DB_ROOT_PASS
END
  mysqladmin -u root password $DB_ROOT_PASS
fi

if [ ! -f /home/app/.my.cnf ]; then
  DB_PASS=$(pwgen 16 1)
  cat > /home/app/.my.cnf <<END
[client]
password=$DB_PASS
END
  chown app:www-data /home/app/.my.cnf
  mysqladmin -u root -p${DB_ROOT_PASS} create app
  echo "GRANT all on app.* to app@localhost identified by '$DB_PASS'; FLUSH PRIVILEGES;" | mysql -u root -p${DB_ROOT_PASS} mysql
fi
