#!/bin/bash
set -ex

RUN_UNITY=${RUN_UNITY:-yes}
RUN_XTERM=${RUN_XTERM:-yes}

case $RUN_FLUXBOX in
  false|no|n|0)
    rm -f /app/conf.d/unity.conf
    ;;
esac

case $RUN_XTERM in
  false|no|n|0)
    rm -f /app/conf.d/xterm.conf
    ;;
esac

x11vnc -storepasswd
expect "Enter VNC password:"
send "helloworld"
expect "Verify password:"
send "helloworld"


exec supervisord -c /app/supervisord.conf
