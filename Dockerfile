# https://stackoverflow.com/a/59632971/
FROM golang:alpine as golang

RUN apk add --no-cache build-base git

RUN mkdir /lib64 && ln -s /lib/libc.musl-x86_64.so.1 /lib64/ld-linux-x86-64.so.2

RUN git clone https://github.com/ochinchina/supervisord /go/src/github.com/ochinchina/supervisord

WORKDIR /go/src/github.com/ochinchina/supervisord

RUN go install -a -ldflags '-linkmode external -w -s -extldflags "-static" ' .

FROM scratch
COPY --from=golang /go/bin/supervisord /usr/local/bin/supervisord
ENTRYPOINT ["/usr/local/bin/supervisord"]