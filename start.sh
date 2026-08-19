#!/bin/bash

export PORT=${PORT:-8080}

envsubst '${PORT}' < /app/nginx.conf.template > /etc/nginx/sites-enabled/default

xray -c /usr/local/etc/xray/config.json &

python3 /app/app.py &

nginx -g "daemon off;"
