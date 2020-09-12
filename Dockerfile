FROM alpine:3


# Expose Privoxy port - http proxy
EXPOSE 8118
# Expose Tor port - socks5 proxy
EXPOSE 9050


RUN apk --update add privoxy tor runit tini

COPY service /etc/service/

ENTRYPOINT ["tini", "--"]
CMD ["runsvdir", "/etc/service"]
