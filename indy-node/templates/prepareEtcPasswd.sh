#!/bin/sh

# Sets new /etc/passwd file

export USER_ID=$(id -u)
export GROUP_ID=$(id -g)
envsubst < /tmp/passwd.template > /tmp/passwd
export LD_PRELOAD=/usr/lib/libnss_wrapper.so
export NSS_WRAPPER_PASSWD=/tmp/passwd
export NSS_WRAPPER_GROUP=/etc/group

echo "Indy node prepared to run as user indy"