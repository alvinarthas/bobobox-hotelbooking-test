package models

import "github.com/jinzhu/gorm"

// Type is model for the Type
type Type struct {
	gorm.Model
	Name      string
	MaxPeople int
	Size      string
	Facility  string
	Qty       int
	HotelID   uint
}
