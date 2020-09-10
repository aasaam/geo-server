#!/bin/bash
export HTTP_PROXY=$HTTP_PROXY
export HTTPS_PROXY=$HTTP_PROXY
cd /
/usr/local/bin/waitress-serve --host=$LISTEN_HOST --port=$LISTEN_PORT config:application
