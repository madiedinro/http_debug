FROM golang:alpine
LABEL maintainer="Dmitry Rodin<madiedinro@gmail.com>"
RUN apk --no-cache add git
ADD . .
RUN go get github.com/gin-gonic/gin && go build -v
ENTRYPOINT ["/root/app"]

