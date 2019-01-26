FROM sirboops/nodejs:8.15.0-alpine

ENV TRANS_HASH=585d8e58714fd0b34bb121451d9f31f9c8b30f95
ENV PATH=${PATH}:/opt/node/bin

RUN apk add --virtual deps git && \
	cd /opt && \
	git clone https://git.sergal.org/Sir-Boops/trans-s3-b2 && \
	cd trans-s3-b2 && \
	git checkout $TRANS_HASH && \
	npm install

WORKDIR /opt/trans-s3-b2
CMD node index.js
