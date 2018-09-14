package main

import (
	"flag"
	"fmt"
	"net/http"
	"os"

	"github.com/gin-gonic/gin"
)

func getEnv(env string, def string) string {
	envVal := os.Getenv(env)
	if envVal != "" {
		return envVal
	}
	return def
}

func main() {
	flag.Parse()
	gin.SetMode(gin.ReleaseMode)

	listen := getEnv("PORT", "8080")

	fmt.Printf("Starting http server on %s\n", listen)

	router := gin.Default()
	router.GET("/*any", func(c *gin.Context) {
		c.JSON(http.StatusOK, gin.H{
			"path":    c.Request.URL.Path,
			"host":    c.Request.Host,
			"headers": c.Request.Header,
			"remote":  c.Request.RemoteAddr,
		})
	})
	router.Run(fmt.Sprintf(":%s", listen))
}
