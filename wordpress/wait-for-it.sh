#!/bin/sh
# wait-for-it.sh

set -e

host="$HOST"

shift
cmd="$@"

until mysql -h "$HOST" -u "$USER" -p"$PASS" -e "show databases" -w; do
  >&2 echo "MariaDB is unavailable - sleeping"
  sleep 1
done

>&2 echo "MariaDB is up - executing command"

# exec $cmd
# Path: wordpress/init-wp.sh
