package main

import (
	"example/delivery-service/internal/user"
	"log"
	"net/http"
)

func main() {
	log.Println("main() - starting app...")
	db := Connect()
	db.Ping()
	userHandler := user.NewUserHandler(db)
	server := http.NewServeMux()
	server.Handle("/users", userHandler)
	server.Handle("/users/", userHandler)
	http.ListenAndServe(":8080", server)
}
