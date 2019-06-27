FROM alpine:3.10

LABEL MAINTAINER="rootpia <nothing>"

RUN echo "http://dl-8.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories &&\
    echo "http://dl-cdn.alpinelinux.org/alpine/v3.5/main" >> /etc/apk/repositories

RUN apk --no-cache --update \
      musl musl-dev \
      linux-headers gcc g++ make gfortran \
      freetype freetype-dev \
      'python3=3.5.6-r0' python3-dev \
      libpng libpng-dev \
      openblas openblas-dev &&\
    # python link
    ln -fs /usr/include/locale.h /usr/include/xlocale.h && \
    ln -fs /usr/bin/python3 /usr/local/bin/python && \
    ln -fs /usr/bin/pip3 /usr/local/bin/pip && \
    # python package
    pip3 install -v --no-cache-dir --upgrade pip &&\
    pip3 install -v --no-cache-dir \
      numpy cython scikit-learn matplotlib &&\
    # clean
    apk del --purge libpng-dev openblas-dev python3-dev freetype-dev musl-dev &&\
    rm -vrf /var/cache/apk/*
