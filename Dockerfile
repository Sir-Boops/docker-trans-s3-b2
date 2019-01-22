FROM golang:1.11.4-alpine3.8 as build

ENV TRANS_HASH=839c1c508169cfbb73c287634f7b876067c28205

RUN	cd ~ && \
	apk add git && \
	git clone https://git.sergal.org/Sir-Boops/trans-s3-b2.git && \
	cd trans-s3-b2 && \
	git checkout $TRANS_HASH && \
	go build .

FROM alpine:3.8

RUN apk add ca-certificates

COPY --from=build /root/trans-s3-b2/trans-s3-b2 /trans-s3-b2
