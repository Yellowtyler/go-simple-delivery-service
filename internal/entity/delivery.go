package entity

import (
	"time"

	"github.com/google/uuid"
)

type Delivery struct {
	Id        uuid.UUID
	Name      string
	Order     Order
	CreatedAt time.Time
}
