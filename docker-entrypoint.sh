#!/usr/bin/env sh
set -e

if [ "$(printf %c "$1")" = '-' ]; then
  set -- /sbin/tini -- php /composer/vendor/bin/pdepend "$@"
elif [ "$1" = "/composer/vendor/bin/pdepend" ]; then
  set -- /sbin/tini -- php "$@"
elif [ "$1" = "pdepend" ]; then
  set -- /sbin/tini -- php /composer/vendor/bin/"$@"
elif [ -d "$1" ]; then
  set -- /sbin/tini -- php /composer/vendor/bin/pdepend "$@"
fi

exec "$@"
