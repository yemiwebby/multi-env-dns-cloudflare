package main

import (
	"fmt"
	"log"
	"net/http"
	"os"
)

func main() {
	env := os.Getenv("APP_ENV")
	if env == "" {
		env = "unknown"
	}

	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		fmt.Fprintf(w, "Welcome to the %s environment!", env)
	})

	port := os.Getenv("PORT")
	if port == "" {
		port = "8080"
	}

	log.Printf("Starting server in %s on port %s", env, port)
	log.Fatal(http.ListenAndServe(":"+port, nil))
}
