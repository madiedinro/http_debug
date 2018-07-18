FROM golang:alpine

RUN apk --no-cache add ca-certificates git

WORKDIR /app

ADD . .
RUN go get github.com/gin-gonic/gin
RUN go build -v

EXPOSE 8080

CMD ["/app/app"]

