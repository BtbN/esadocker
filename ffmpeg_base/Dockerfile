FROM debian:jessie

ENV DEBIAN_FRONTEND noninteractive

RUN \
	X264_COMMIT="3b70645597bea052d2398005bc723212aeea6875" && \
	FFMPEG_COMMIT="31ce01bdb9722a552d5b316d97aa6e294de0c7cc" && \
	BDEPS="build-essential yasm git" && \
	apt-get -y update && \
	apt-get -y install $BDEPS && \
	cd /root && \
	git clone https://github.com/mirror/x264.git x264 && \
	cd x264 && \
	git checkout $X264_COMMIT && \
	./configure --prefix=/usr --enable-pic --disable-cli --disable-opencl --enable-static --disable-interlaced --disable-avs --disable-swscale --disable-lavf --disable-ffms --disable-gpac --disable-lsmash && \
	make -j4 && \
	make install && \
	cd /root && \
	rm -rf x264 && \
	git clone https://github.com/FFmpeg/FFmpeg.git FFmpeg && \
	cd FFmpeg && \
	git checkout $FFMPEG_COMMIT && \
	./configure --prefix=/usr --disable-doc --disable-shared --enable-static --enable-gpl --enable-libx264 && \
	make -j4 && \
	make install && \
	cd /root && \
	rm -rf FFmpeg && \
	apt-get -y remove --purge $BDEPS $(apt-mark showauto) && \
	apt-get clean && \
	rm -rf /var/lib/apt/lists/*

