#!/bin/sh

echo "r_host=\"$ICECAST_HOST\"" > config.liq
echo "r_outputport=$ICECAST_PORT" >> config.liq
echo "r_passwd=\"$ICECAST_PASS\"" >> config.liq

./monitor.sh /music &
liquidsoap ./radio.liq
