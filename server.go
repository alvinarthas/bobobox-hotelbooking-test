package main

import (
	"github.com/alvinarthas/bobobox-hotelbooking-test/config"
	"github.com/alvinarthas/bobobox-hotelbooking-test/handlers"
	"github.com/gin-gonic/gin"
)

func main() {
	// set up database
	config.InitDB()
	defer config.DB.Close()

	//  Setting Default Router
	router := gin.Default()

	// Initialize Version
	apiV1 := router.Group("/api/v1/")
	{
		// Normal Register and Login
		apiV1.POST("/search", handlers.SearchHotel)
	}

	router.Run()
}
