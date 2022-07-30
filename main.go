package main

import (
	"fmt"
	"github.com/gin-gonic/gin"
	"github.com/kelseyhightower/envconfig"
	"log"
	"net/http"
)

func main() {
	var cfg Configuration
	err := envconfig.Process("awesomeapp", &cfg)
	if err != nil {
		log.Fatal(err.Error())
	}

	r := gin.Default()

	format := "Version %s"
	r.GET("/ping", func(c *gin.Context) {
		c.JSON(http.StatusOK, gin.H{
			"message": fmt.Sprintf(format, cfg.Version),
		})
	})
	r.Run() // listen and serve on 0.0.0.0:8080 (for windows "localhost:8080")
}
