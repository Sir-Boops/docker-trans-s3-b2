FROM sirboops/nodejs:8.15.0-alpine

ENV TRANS_HASH=dbe11fa8d2ad73024158112c9e622370ec0eef33
ENV PATH=${PATH}:/opt/node/bin

RUN apk add --virtual deps git && \
	cd /opt && \
	git clone https://git.sergal.org/Sir-Boops/trans-s3-b2 && \
	cd trans-s3-b2 && \
	git checkout $TRANS_HASH && \
	npm install

WORKDIR /opt/trans-s3-b2
CMD node index.js
