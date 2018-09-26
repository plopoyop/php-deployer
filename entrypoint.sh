#!/bin/sh
set -e

if [ "$1" = 'dep' ] || [ "$1" = '/usr/local/bin/dep' ]; then
    exec su-exec user "$@"
fi

exec "$@"
