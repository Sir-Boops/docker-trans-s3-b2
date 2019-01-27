FROM sirboops/nodejs:8.15.0-alpine

ENV TRANS_HASH=ed88aeaa63a331afed748a5cdbb26b5b04773387
ENV PATH=${PATH}:/opt/node/bin

RUN apk add --virtual deps git && \
	cd /opt && \
	git clone https://git.sergal.org/Sir-Boops/trans-s3-b2 && \
	cd trans-s3-b2 && \
	git checkout $TRANS_HASH && \
	npm install

WORKDIR /opt/trans-s3-b2
CMD node index.js
