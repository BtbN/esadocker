FROM btbn/ffmpeg_base

RUN \
	NGINX_COMMIT="release-1.11.13" && \
	RTMP_COMMIT="04f0ab97ac61d181dbfdaa5299412fc3064e95a3" && \
	BDEPS="build-essential wget libpcre3-dev libssl-dev zlib1g-dev pkg-config" && \
	RDEPS="libpcre3 openssl zlib1g" && \
	apt-get -y update && \
	apt-get -y install $RDEPS $BDEPS && \
	cd /root && \
	wget "https://github.com/arut/nginx-rtmp-module/archive/${RTMP_COMMIT}.tar.gz" -O rtmp.tar.gz && \
	tar xaf rtmp.tar.gz && \
	rm rtmp.tar.gz && \
	mv nginx-rtmp-module-* nginx-rtmp-module && \
	wget "https://github.com/nginx/nginx/archive/${NGINX_COMMIT}.tar.gz" -O nginx.tar.gz && \
	tar xaf nginx.tar.gz && \
	rm nginx.tar.gz && \
	cd nginx-* && \
	./auto/configure --prefix=/usr --builddir=build --conf-path=/config/nginx.conf --error-log-path=/logs/error.log --http-log-path=/logs/access.log --add-module=/root/nginx-rtmp-module --with-ipv6 && \
	make -j4 && \
	make install && \
	cd /root && \
	rm -rf nginx-rtmp-module nginx* && \
	apt-get -y remove --purge $BDEPS && \
	apt-get -y install $RDEPS && \
	apt-get -y autoremove && \
	apt-get clean && \
	rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp* /config/* && \
	mkdir -p /config /logs /record

ADD nginx.conf /config/nginx.conf
ADD ffmpeg_wrapper.sh /config/ffmpeg_wrapper.sh

EXPOSE 80 443 1935
VOLUME /record /config

CMD ["/usr/sbin/nginx"]

