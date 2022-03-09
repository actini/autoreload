FROM openresty/openresty:alpine

COPY shells /actini/shells

RUN chmod +x /actini/shells/* && apk add inotify-tools --no-cache

ENTRYPOINT [ "/actini/shells/entrypoint.sh" ]

CMD ["/usr/local/openresty/bin/openresty", "-g", "daemon off;"]
