#!/bin/sh

stop_services() {
    kill -TERM $pid1 $pid2 2>/dev/null
    wait $pid1 $pid2
    exit 0
}

trap stop_services SIGTERM SIGINT

echo "start mcsmanager daemon"
cd /opt/mcsmanager/daemon/ && node --max-old-space-size=8192 --enable-source-maps app.js &
pid1=$!

echo "start mcsmanager web"
cd /opt/mcsmanager/web/ && node --max-old-space-size=8192 --enable-source-maps app.js &
pid2=$!

wait $pid1 $pid2