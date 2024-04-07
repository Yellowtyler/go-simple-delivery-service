package entity

import (
	"time"

	"github.com/google/uuid"
)

const (
	INIT       = iota
	STARTED    = iota
	COOKING    = iota
	READY      = iota
	DELIVERING = iota
	DELIVERED  = iota
)

type Order struct {
	Id           uuid.UUID
	Content      []Food
	RestaurantId uuid.UUID
	DeliveryId   uuid.UUID
	UserId       uuid.UUID
	Price        int
	Status       int
	CreatedAt    time.Time
}
