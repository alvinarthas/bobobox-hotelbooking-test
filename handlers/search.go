package handlers

import (
	"time"

	"github.com/alvinarthas/bobobox-hotelbooking-test/config"
	"github.com/alvinarthas/bobobox-hotelbooking-test/models"
	"github.com/gin-gonic/gin"
)

// Data for return Data
type Data struct {
	TypeRoom      string `json:"type_room"`
	MaxPeople     int    `json:"max_people"`
	Size          string `json:"size"`
	Facility      string `json:"facility"`
	Hotel         string `json:"hotel"`
	Price         int    `json:"price"`
	AvailableRoom int    `json:"available_room"`
}

// SearchHotel is to get all prodcuts -> Admin Only
func SearchHotel(c *gin.Context) {
	// Get Post Request
	format := "2006-01-02"
	checkIn, _ := time.Parse(format, c.PostForm("check_in"))
	checkOut, _ := time.Parse(format, c.PostForm("check_out"))

	// Prepare Variables
	types := []models.Type{}
	var count int
	data := []Data{}

	// Get all Types
	if config.DB.Find(&types).RecordNotFound() {
		c.JSON(404, gin.H{
			"status":  "error",
			"message": "record not found"})
		c.Abort()
		return
	}

	// Loop All Types of Room
	for _, v := range types {
		var roomPrice models.RoomPrice

		// Proceed the process if, the prices of room types if available
		if !config.DB.Where("type_id = ?", v.ID).Where("start_date <= ?", checkIn).Where("end_date >= ?", checkIn).Order("start_date desc").First(&roomPrice).RecordNotFound() {
			var initData Data
			var hotel models.Hotel

			// Find Total Amount of CheckIn
			config.DB.Model(&models.Stay{}).Where("type_id = ?", v.ID).Where("check_out >= ?", checkIn).Where("check_in <= ?", checkOut).Where("check_out <> ?", checkOut).Count(&count)

			// QTY of Room Type - Total Amount CheckIn
			rest := v.Qty - count

			// Get Hotel Name
			config.DB.Where("id = ?", v.HotelID).First(&hotel)

			// Store into data struct
			initData.AvailableRoom = rest
			initData.Price = roomPrice.Price
			initData.TypeRoom = v.Name
			initData.MaxPeople = v.MaxPeople
			initData.Size = v.Size
			initData.Facility = v.Facility
			initData.Hotel = hotel.Name

			data = append(data, initData)
		}
	}

	// Return Information Data
	c.JSON(200, gin.H{
		"status": "success",
		"data":   data,
	})
}
