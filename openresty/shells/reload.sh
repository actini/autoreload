#! /bin/sh

inotifywait -m -r -e modify -e move -e create -e delete /usr/local/openresty/nginx/conf | while read changes; do
    echo "$changes"

    /usr/local/openresty/nginx/sbin/nginx -t

    if [ $? -ne 0 ]
    then
        echo "[$(date)] ERROR: Bad syntax"
        continue
    fi

    /usr/local/openresty/nginx/sbin/nginx -s reload
    echo "[$(date)] Nginx configuration reloaded"
done
