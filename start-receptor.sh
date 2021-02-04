#!/bin/sh

CONF=conf/$HOSTNAME.conf

nohup receptor -c $CONF &

#
# EOF
#
