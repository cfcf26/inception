#!/bin/sh

cd /var/www/wordpress
/wait-for-it.sh mariadb:3306 --timeout=60

# # MySQL 서버가 준비될 때까지 기다림
# mysql -h "$HOST" -u "$USER" -p"$PASS" -e "show databases" -w
# wp-config.php 파일 생성
wp config create --dbname="$DB" --dbuser="$USER" --dbpass="$PASS" --dbhost="$HOST" --allow-root

# WordPress 설치
wp core install --url="http://ekwak.42seoul.kr" --path="/var/www/wordpress" --title="WordPress" --admin_user="$USER" --admin_password="$PASS" --admin_email="$USER_EMAIL" --allow-root

# 추가 사용자 생성
wp user create $USER1 $USER1_EMAIL --role=editor --user_pass=$PASS1 --allow-root

# PHP-FPM 실행
php-fpm7 -F
