FROM alpine:3.4

MAINTAINER https://github.com/debtcollapse

ENV CURL_VERSION 7_52_1
ENV CURL_URL https://github.com/curl/curl
ENV NGHTTP2_URL https://github.com/tatsuhiro-t/nghttp2.git

COPY scripts/installer.sh /tmp/installer.sh

# Install dependencies
RUN apk --update upgrade && \
    apk add \
    ca-certificates \
    openssl \
    openssl-dev \
    gcc \
    g++ \
    libgcc \
    libstdc++ \
    git \
    jemalloc \
    jemalloc-dev \
    libev \
    libev-dev \
    autoconf \
    libtool \
    automake \
    make && \
    # Install curl with nghttp2
    /bin/sh /tmp/installer.sh && \
    # Cleanup
    cd / && \
    rm -rf /tmp/* && \
    apk del \
    gcc \
    g++ \
    libgcc \
    libstdc++ \
    git \
    jemalloc \
    jemalloc-dev \
    libev \
    libev-dev \
    autoconf \
    libtool \
    automake \
    make && \
    rm -rf /var/cache/apk/* && \
    mkdir -p /curl-config

COPY conf/curl-output.txt /curl-config/

WORKDIR /root

ENTRYPOINT ["/usr/local/bin/curl", "-vw", "@/curl-config/curl-output.txt"]
CMD ["--help"]
