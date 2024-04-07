package user

import "database/sql"

type UserStore struct {
	db *sql.DB
}

func newUserStore(db *sql.DB) *UserStore {
	return &UserStore{db}
}

func (store *UserStore) createUser() error {
	return nil
}

func (store *UserStore) getUser() {

}
