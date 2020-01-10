FROM golang:1.13.6-stretch AS builder
WORKDIR /dist
COPY back.go .
RUN go build back.go
RUN ldd back | tr -s '[:blank:]' '\n' | grep '^/' | \
    xargs -I % sh -c 'mkdir -p $(dirname ./%); cp % ./%;'
RUN mkdir -p lib64 && cp /lib64/ld-linux-x86-64.so.2 lib64/

FROM scratch
WORKDIR /app
COPY --from=builder /dist /
ENTRYPOINT ["/back"]
