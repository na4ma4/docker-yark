FROM alpine:3.17

VOLUME ["/yark"]
WORKDIR /yark

RUN apk --no-cache add python3 py3-pip patch \
 && addgroup -S -g 1000 yark && adduser -S -u 1000 -G yark yark \
 && chown yark:yark /yark \
 && pip3 install yark

COPY 0001-patch-to-bind-to-all.patch /tmp/0001-patch-to-bind-to-all.patch

RUN cat /tmp/0001-patch-to-bind-to-all.patch | patch -p1 /usr/lib/python3.10/site-packages/yark/cli.py

USER yark

EXPOSE "7667/tcp"

ENTRYPOINT [ "/usr/bin/yark" ]

CMD ["view"]
