git clone ${NGHTTP2_URL} /tmp/nghttp2 && \
cd /tmp/nghttp2
autoreconf -i && \
automake && \
autoconf && \
./configure && \
make && \
make install-strip

git clone -b curl-${CURL_VERSION} ${CURL_URL} /tmp/curl && \
cd /tmp/curl
autoreconf -i && \
automake && \
autoconf && \
./configure --with-nghttp2=/usr/local --with-ssl && \
make && \
make install
