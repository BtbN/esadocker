FROM debian:jessie

ENV DEBIAN_FRONTEND noninteractive

RUN \
	X264_COMMIT="3b70645597bea052d2398005bc723212aeea6875" && \
	FFMPEG_COMMIT="31ce01bdb9722a552d5b316d97aa6e294de0c7cc" && \
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

