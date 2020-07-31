package models

import (
	"time"

	"github.com/jinzhu/gorm"
)

// RoomPrice is model for the Type
type RoomPrice struct {
	gorm.Model
	Price     int
	StartDate time.Time
	EndDate   time.Time
	TypeID    uint
}
