package entity

import (
	"time"

	"github.com/google/uuid"
)

type Restaurant struct {
	Id        uuid.UUID
	Name      string
	CreatedAt time.Time
}
