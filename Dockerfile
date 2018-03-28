FROM golang:alpine

RUN apk add --no-cache --update git

RUN go get -v -u github.com/ochinchina/supervisord

RUN go build -o /usr/local/bin/supervisord github.com/ochinchina/supervisord
