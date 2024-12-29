#!/bin/sh

stop_services() {
    echo "Stopping services..."
    kill -TERM $pid1 $pid2 2>/dev/null
    wait $pid1 $pid2
    exit 0
}

trap stop_services SIGTERM SIGINT

cd /opt/mcsmanager/daemon/ && node --max-old-space-size=8192 --enable-source-maps app.js &
pid1=$!

cd /opt/mcsmanager/web/ && node --max-old-space-size=8192 --enable-source-maps app.js &
pid2=$!

wait $pid1 $pid2