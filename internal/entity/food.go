package entity

import (
	"time"

	"github.com/google/uuid"
)

type Food struct {
	Id           uuid.UUID
	Name         string
	Price        int
	RestaurantId uuid.UUID
	CreatedAt    time.Time
}
