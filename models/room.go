package models

import (
	"github.com/jinzhu/gorm"
)

// Room is model for the Type
type Room struct {
	gorm.Model
	Name   string
	Floor  string
	TypeID uint
}
