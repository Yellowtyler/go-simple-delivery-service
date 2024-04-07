package user

import (
	"database/sql"
	"net/http"
)

type UserHandler struct {
	userStore *UserStore
}

func NewUserHandler(db *sql.DB) *UserHandler {
	userStore := newUserStore(db)
	return &UserHandler{userStore: userStore}
}

func (userHandler *UserHandler) ServeHTTP(w http.ResponseWriter, r *http.Request) {

}
