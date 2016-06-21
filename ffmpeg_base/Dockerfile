FROM debian:jessie

ENV DEBIAN_FRONTEND noninteractive

RUN \
	X264_COMMIT="3f5ed56d4105f68c01b86f94f41bb9bbefa3433b" && \
	FFMPEG_COMMIT="28dcf1870660ea353ccc8e7a907712e681174228" && \
	BDEPS="build-essential yasm wget pkg-config" && \
	apt-get -y update && \
	apt-get -y install $BDEPS && \
	cd /root && \
	wget "https://github.com/mirror/x264/archive/${X264_COMMIT}.tar.gz" -O x264.tar.gz && \
	tar xaf x264.tar.gz && \
	cd x264* && \
	./configure --prefix=/usr --enable-pic --enable-shared --disable-cli --disable-opencl --disable-interlaced --disable-avs --disable-swscale --disable-lavf --disable-ffms --disable-gpac --disable-lsmash && \
	make -j4 && \
	make install && \
	cd /root && \
	rm -rf x264* && \
	wget "https://github.com/FFmpeg/FFmpeg/archive/${FFMPEG_COMMIT}.tar.gz" -O ffmpeg.tar.gz && \
	tar xaf ffmpeg.tar.gz && \
	cd FFmpeg* && \
	./configure --prefix=/usr --disable-doc --disable-static --enable-shared --enable-gpl --enable-libx264 && \
	make -j4 && \
	make install && \
	cd /root && \
	rm -rf FFmpeg* && \
	apt-get -y remove --purge $BDEPS $(apt-mark showauto) && \
	apt-get clean && \
	rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp*

