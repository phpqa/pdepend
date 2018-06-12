#!/bin/sh
set -e

if [ "${1:0:1}" = "-" ]; then
  set -- /sbin/tini -- php /vendor/bin/pdepend "$@"
elif [ "$1" = "/vendor/bin/pdepend" ]; then
  set -- /sbin/tini -- php "$@"
elif [ "$1" = "pdepend" ]; then
  set -- /sbin/tini -- php /vendor/bin/"$@"
elif [ -d "$1" ]; then
  set -- /sbin/tini -- php /vendor/bin/pdepend "$@"
fi

exec "$@"
