# syntax=docker/dockerfile:1
FROM python:3.11
ENV PYTHONFAULTHANDLER=1 \
  PYTHONUNBUFFERED=1 \
  PYTHONHASHSEED=random \
  PIP_NO_CACHE_DIR=off \
  PIP_DISABLE_PIP_VERSION_CHECK=on \
  PIP_DEFAULT_TIMEOUT=100 \
  DOCKER_CONTAINER=1

VOLUME ["/yark"]
WORKDIR /yark

ARG YARK_VERSION=add-docker-support-v4
RUN addgroup --system --gid 1000 yark \
 && adduser --system -u 1000 --gid 1000 yark \
 && chown yark:yark /yark \
 && pip install https://github.com/na4ma4/yark/archive/${YARK_VERSION}.zip

# COPY 0001-patch-to-bind-to-all.patch /tmp/0001-patch-to-bind-to-all.patch
# RUN --mount=type=secret,id=bind.patch,target=/tmp/0001-patch-to-bind-to-all.patch \
#   cat /tmp/0001-patch-to-bind-to-all.patch | patch -p1 /usr/lib/python3.10/site-packages/yark/cli.py

USER yark

WORKDIR /yark
EXPOSE "7667/tcp"
ENTRYPOINT [ "/usr/local/bin/yark" ]
CMD ["view"]
