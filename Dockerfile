FROM golang:alpine
LABEL maintainer="Dmitry Rodin<madiedinro@gmail.com>"
RUN apk --no-cache add git && mkdir -p /httpdebug
WORKDIR /httpdebug
ADD . .
RUN go get github.com/gin-gonic/gin && go build -v
ENTRYPOINT ["/httpdebug/httpdebug"]

