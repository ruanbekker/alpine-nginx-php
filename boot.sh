#!/usr/bin/env sh
sed -i "s/CONF_SERVER_NAME/${SERVER_NAME:-_}/g" /etc/nginx/conf.d/default.conf
sed -i "s/CONF_ROOT/${CONTENT_PATH:-\/var\/www\/localhost\/htdocs}/g" /etc/nginx/conf.d/default.conf
/usr/bin/supervisord -c /etc/supervisor.d/nginx-supervisor.ini
