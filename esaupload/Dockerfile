FROM btbn/ffmpeg_base

RUN \
	ESAUPLOAD_COMMIT="1337c6add57738bd24b5ad7b874e3199929518f3" && \
	BDEPS="python3-pip python3-dev git virtualenv" && \
	RDEPS="python3-minimal less nano vim" && \
	apt-get -y update && \
	apt-get -y install $BDEPS $RDEPS && \
	virtualenv -p /usr/bin/python3 /venv && \
	/venv/bin/pip install --upgrade setuptools pip && \
	/venv/bin/pip install git+https://github.com/BtbN/esaupload.git@$ESAUPLOAD_COMMIT && \
	apt-get -y remove --purge --auto-remove $BDEPS && \
	apt-get clean && \
	rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp* && \
	mkdir -p /record /config

ENV PATH /venv/bin:$PATH
VOLUME /record /config

