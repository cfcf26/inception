#!/bin/sh

# 이미 존재하는 데이터베이스가 있는지 확인
if [ ! -d "/var/lib/mysql/mysql" ]; then
    mysql_install_db --user=mysql --datadir=/var/lib/mysql

    # 사용자와 데이터베이스 생성
    mysqld --user=mysql --skip-networking &
    sleep 5

    mysql -u root <<EOF
        CREATE DATABASE IF NOT EXISTS $DB;
        CREATE USER IF NOT EXISTS '$USER1'@'%' IDENTIFIED BY '$PASS1';
        CREATE USER IF NOT EXISTS '$USER'@'%' IDENTIFIED BY '$PASS';
        GRANT ALL PRIVILEGES ON $DB.* TO '$USER1'@'%' IDENTIFIED BY '$PASS1';
        GRANT ALL PRIVILEGES ON $DB.* TO '$USER'@'%' IDENTIFIED BY '$PASS' WITH GRANT OPTION;
        FLUSH PRIVILEGES;
EOF

    if [ $? -ne 0 ]; then
        echo "Failed to create database or user."
        exit 1
    fi

    killall mysqld
    sleep 5
fi

# MariaDB 서버 실행
exec mysqld
