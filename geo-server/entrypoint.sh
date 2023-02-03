#!/bin/bash
cd /
/usr/local/bin/waitress-serve --host=$LISTEN_HOST --port=$LISTEN_PORT config:application
