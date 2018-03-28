# Supervisord in Golang

This image compiles ochinchina/supervisord for use in other images.

Example usage:

```
FROM alpine

COPY --from=lslio/supervisord:latest /usr/local/bin/supervisord /usr/local/bin/supervisord

COPY . /apps

ENTRYPOINT ["supervisord"]
```

