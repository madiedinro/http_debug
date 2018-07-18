package main

import (
	"flag"
	"fmt"
	"net/http"

	"github.com/gin-gonic/gin"
)

var (
	listen = flag.String("listen", ":19991", "Listen. Default :19991")
)

func main() {
	flag.Parse()
	fmt.Printf("Starting http server on %s\n", *listen)
	gin.SetMode(gin.ReleaseMode)

	router := gin.Default()
	router.GET("/*any", func(c *gin.Context) {
		c.JSON(http.StatusOK, gin.H{
			"path":    c.Request.URL.Path,
			"host":    c.Request.Host,
			"headers": c.Request.Header,
			"remote":  c.Request.RemoteAddr,
		})
	})
	router.Run(*listen)
}
