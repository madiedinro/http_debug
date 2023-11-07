FROM golang:alpine  as builder
LABEL maintainer="Dmitry Rodin <madiedinro@gmail.com>"

WORKDIR /go/src/github.com/madiedinro/http_debug
ENV GOPATH=/go

COPY . .

RUN go env -w GO111MODULE=off
RUN go build -ldflags '-extldflags "-static"' github.com/madiedinro/http_debug

FROM alpine:latest

RUN apk --no-cache add ca-certificates
WORKDIR /
COPY --from=builder /go/src/github.com/madiedinro/http_debug/http_debug /usr/bin/http_debug

ENV GIN_MODE=release

CMD ["/usr/bin/http_debug"]
