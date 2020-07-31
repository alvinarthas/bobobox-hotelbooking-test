package models

import (
	"time"

	"github.com/jinzhu/gorm"
)

// Reservation is model for the Type
type Reservation struct {
	gorm.Model
	OrderID      string
	CustomerName string
	Date         time.Time
	TotalPrice   int
}
