# syntax=docker/dockerfile:1
FROM python:3.11-alpine

VOLUME ["/yark"]
WORKDIR /yark

ARG YARK_VERSION=master
RUN addgroup -S -g 1000 yark && adduser -S -u 1000 -G yark yark \
 && chown yark:yark /yark \
 && pip install https://github.com/Owez/yark/archive/${YARK_VERSION}.zip

# COPY 0001-patch-to-bind-to-all.patch /tmp/0001-patch-to-bind-to-all.patch
# RUN --mount=type=secret,id=bind.patch,target=/tmp/0001-patch-to-bind-to-all.patch \
#   cat /tmp/0001-patch-to-bind-to-all.patch | patch -p1 /usr/lib/python3.10/site-packages/yark/cli.py

USER yark

EXPOSE "7667/tcp"

ENTRYPOINT [ "/usr/bin/yark" ]

CMD ["view"]
