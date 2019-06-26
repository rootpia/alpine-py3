FROM alpine:3.10

RUN echo "http://dl-8.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories
RUN apk --no-cache --update-cache \
      add \
      musl \
      linux-headers \
      gcc \
      g++ \
      make \
      gfortran \
      python3 \
      python3-dev \
      libpng-dev \
      libjpeg-dev \
      openblas-dev

RUN pip3 install --upgrade pip 
RUN pip3 install \
      numpy \
      scipy  \
      scikit-learn \
      matplotlib \
      'pandas<0.21.0'
