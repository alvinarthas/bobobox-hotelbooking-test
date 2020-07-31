package config

import (
	"github.com/alvinarthas/bobobox-hotelbooking-test/models"
	"github.com/jinzhu/gorm"

	// set mysql
	_ "github.com/jinzhu/gorm/dialects/mysql"
)

// DB is for initialization Connection
var DB *gorm.DB

// InitDB is
func InitDB() {
	var err error

	// Setting Database MYSQL
	DB, err = gorm.Open("mysql", "root:@/bobobox_hotel?charset=utf8&parseTime=True&loc=Local")

	if err != nil {
		panic("failed to connect database")

	}

	// Migrate the Database

	// Hotel
	DB.AutoMigrate(&models.Hotel{})
	// Reservation
	DB.AutoMigrate(&models.Reservation{})
	// Type
	DB.AutoMigrate(&models.Type{}).AddForeignKey("hotel_id", "hotels(id)", "CASCADE", "CASCADE")
	// Room
	DB.AutoMigrate(&models.Room{}).AddForeignKey("type_id", "types(id)", "CASCADE", "CASCADE")
	// Stay
	DB.AutoMigrate(&models.Stay{}).AddForeignKey("reservation_id", "reservations(id)", "CASCADE", "CASCADE").AddForeignKey("room_id", "rooms(id)", "CASCADE", "CASCADE")
	// RoomPrice
	DB.AutoMigrate(&models.RoomPrice{}).AddForeignKey("type_id", "types(id)", "CASCADE", "CASCADE")

	// Related
	DB.Model(&models.Hotel{}).Related(&models.Type{})
	DB.Model(&models.Type{}).Related(&models.Room{})
	DB.Model(&models.Stay{}).Related(&models.Reservation{})
	DB.Model(&models.Stay{}).Related(&models.Room{})
	DB.Model(&models.Stay{}).Related(&models.Type{})
	DB.Model(&models.Type{}).Related(&models.RoomPrice{})

}
