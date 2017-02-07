# curl-http2
Minimal Docker container for curl, compiled with openssl and nghttp2. By default `--verbose` and `--write-out` are both enabled.

I use curl frequently for troubleshooting and I grew tired of not having consistent version and protocol support across multiple platforms.

Exmaple usage:

```
git clone https://github.com/debtcollapse/curl-http2.git
cd curl-http2
docker build --rm -t curl-http2 .
```
Add as an alias to your .bashrc file:
```
echo "alias curl="sudo docker run --rm -it -v $(pwd):/root curl-http2"" >> ~/.bashrc
```
```
curl -o /dev/null --http2 nghttp2.org

* Rebuilt URL to: nghttp2.org/
*   Trying 106.186.112.116...
* TCP_NODELAY set
* Connected to nghttp2.org (106.186.112.116) port 80 (#0)
> GET / HTTP/1.1
> Host: nghttp2.org
> User-Agent: curl/7.52.1-DEV
> Accept: */*
> Connection: Upgrade, HTTP2-Settings
> Upgrade: h2c
> HTTP2-Settings: AAMAAABkAARAAAAA
>
< HTTP/1.1 101 Switching Protocols
< Connection: Upgrade
< Upgrade: h2c
* Received 101
* Using HTTP2, server supports multi-use
* Connection state changed (HTTP/2 confirmed)
* Copying HTTP/2 data in stream buffer to connection buffer after upgrade: len=27
* Connection state changed (MAX_CONCURRENT_STREAMS updated)!
< HTTP/2 200
< date: Tue, 07 Feb 2017 13:54:58 GMT
< content-type: text/html
< last-modified: Wed, 25 Jan 2017 12:22:17 GMT
< etag: "58889879-19e1"
< accept-ranges: bytes
< content-length: 6625
< x-backend-header-rtt: 0.001314
< server: nghttpx nghttp2/1.20.0-DEV
< via: 2 nghttpx
< x-frame-options: SAMEORIGIN
< x-xss-protection: 1; mode=block
< x-content-type-options: nosniff
<
{ [1127 bytes data]
* Curl_http_done: called premature == 0
* Connection #0 to host nghttp2.org left intact

----------------------------------------------------

		Timings:

		Name Lookup:  0.120643
		TCP Connect:  0.385667
		APP Connect:  0.000000
		Pretransfer:  0.386638
		Redirect:  0.000000
		Start Transfer:  0.635205
		---------------------------
		Total:  0.640518

----------------------------------------------------

```
