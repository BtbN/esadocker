FROM debian:jessie

ENV DEBIAN_FRONTEND noninteractive

RUN \
	set -x && \
	X264_COMMIT="8c2974255b01728d4eda2434cc1997c4a3ca5eff" && \
	FFMPEG_COMMIT="6ee4b20f4ae3e726868d3efa038ed3103f69d2a2" && \
	BDEPS="build-essential yasm nasm wget pkg-config" && \
	apt-get -y update && \
	apt-get -y install $BDEPS && \
	cd /root && \
	wget "https://github.com/mirror/x264/archive/${X264_COMMIT}.tar.gz" -O x264.tar.gz && \
	tar xaf x264.tar.gz && \
	rm x264.tar.gz && \
	cd x264* && \
	./configure --prefix=/usr --enable-pic --enable-shared --disable-cli --disable-opencl --disable-interlaced --disable-avs --disable-swscale --disable-lavf --disable-ffms --disable-gpac --disable-lsmash && \
	make -j4 && \
	make install && \
	cd /root && \
	rm -rf x264* && \
	wget "https://github.com/FFmpeg/FFmpeg/archive/${FFMPEG_COMMIT}.tar.gz" -O ffmpeg.tar.gz && \
	tar xaf ffmpeg.tar.gz && \
	rm ffmpeg.tar.gz && \
	cd FFmpeg* && \
	./configure --prefix=/usr --disable-doc --disable-static --enable-shared --enable-gpl --enable-libx264 && \
	make -j4 && \
	make install && \
	cd /root && \
	rm -rf FFmpeg* && \
	apt-get -y remove --purge $BDEPS && \
	apt-get -y autoremove && \
	apt-get clean && \
	rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp*

