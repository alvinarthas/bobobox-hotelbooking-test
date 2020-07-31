package models

import "github.com/jinzhu/gorm"

// Hotel is model for the hotel
type Hotel struct {
	gorm.Model
	Name    string
	Address string
}
