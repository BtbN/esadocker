FROM btbn/ffmpeg_base

RUN \
	NGINX_COMMIT="release-1.10.0" && \
	RTMP_COMMIT="v1.1.7" && \
	BDEPS="build-essential wget libpcre3-dev libssl-dev zlib1g-dev pkg-config" && \
	RDEPS="libpcre3 openssl zlib1g" && \
	apt-get -y update && \
	apt-get -y install $RDEPS $BDEPS && \
	cd /root && \
	wget "https://github.com/arut/nginx-rtmp-module/archive/${RTMP_COMMIT}.tar.gz" -O rtmp.tar.gz && \
	tar xaf rtmp.tar.gz && \
	mv nginx-rtmp-module-* nginx-rtmp-module && \
	wget "https://github.com/nginx/nginx/archive/${NGINX_COMMIT}.tar.gz" -O nginx.tar.gz && \
	tar xaf nginx.tar.gz && \
	cd nginx-* && \
	./auto/configure --prefix=/usr --builddir=build --conf-path=/config/nginx.conf --error-log-path=/logs/error.log --http-log-path=/logs/access.log --add-module=/root/nginx-rtmp-module && \
	make -j4 && \
	make install && \
	cd /root && \
	rm -rf nginx-rtmp-module nginx* && \
	apt-get -y remove --purge $BDEPS $(apt-mark showauto) && \
	apt-get -y install $RDEPS && \
	apt-get clean && \
	rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp* /config/* && \
	mkdir -p /config /logs /record

ADD nginx.conf /config/nginx.conf

EXPOSE 1935
EXPOSE 80
EXPOSE 443

CMD /usr/sbin/nginx

