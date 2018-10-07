#!/bin/sh
set -e

if [ "$1" = 'dep' ] || [ "$1" = '/usr/local/bin/dep' ]; then
    if [ -f /tmp/ssh/${SSH_CONFIG_FILE} ]; then
        cp /tmp/ssh/${SSH_CONFIG_FILE} /home/user/.ssh/config
        chown user: /home/user/.ssh/config -R
        chmod 600 /home/user/.ssh/config -R
    fi;


    if [ -f /tmp/ssh/${SSH_PRIV_KEY} ]; then
        cp /tmp/ssh/${SSH_PRIV_KEY} /home/user/.ssh/id_rsa
        chown user: /home/user/.ssh/id_rsa -R
        chmod 600 /home/user/.ssh/id_rsa -R
        eval `ssh-agent`
        ssh-add /home/user/.ssh/id_rsa
    fi;

    exec su-exec user "$@"
fi

exec "$@"
