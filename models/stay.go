package models

import (
	"time"

	"github.com/jinzhu/gorm"
)

// Stay is model for the Type
type Stay struct {
	gorm.Model
	GuestName     string
	CheckIn       time.Time
	CheckOut      time.Time
	RoomID        uint
	ReservationID uint
	TypeID        uint
}
