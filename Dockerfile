FROM joshendriks/walletbase

ENV GIT_COIN_URL    https://github.com/Actinium-project/Actinium.git
ENV GIT_COIN_NAME   actinium   

RUN	git clone $GIT_COIN_URL $GIT_COIN_NAME \
	&& cd $GIT_COIN_NAME \
	&& git checkout tags/v0.17.2.0 \
	&& chmod +x autogen.sh \
	&& chmod +x share/genbuild.sh \
	&& chmod +x src/leveldb/build_detect_platform \
	&& ./autogen.sh && ./configure \
	&& make \
	&& make install \
	&& cd / && rm -rf /$GIT_COIN_NAME \
	&& mkdir /data \
	&& mkdir /data/.Actinium
	
#Add a config so you can run without providing a bitnodes.conf through a volume
COPY Actinium.conf /data/.actinium/Actinium.conf

#rpc and mn port
EXPOSE 5335 4334

ENV HOME /data

COPY start.sh /start.sh
RUN chmod 777 /start.sh
CMD /start.sh