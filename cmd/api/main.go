package main

import (
	"flag"
	"fmt"
	"log"
	"net/http"

	"github.com/jackc/pgx/v5/pgxpool"
)

const port = 8080

type application struct {
	DSN    string
	Domain string
	DB     *pgxpool.Pool
}

func main() {
	// Set app config
	var app application

	// Read DSN from the command line
	flag.StringVar(&app.DSN, "dsn", "host=localhost port=5432 user=postgres password=postgres dbname=movies sslmode=disable timezone=UTC connect_timeout=5", "Postgres connection string")
	flag.Parse()

	// Connect to the database
	db, err := connectPostgres(app.DSN)
	if err != nil {
		log.Fatalf("Error connecting to the database: %v", err)
	}
	defer db.Close()
	app.DB = db

	app.Domain = "example.com"

	log.Println("Starting application on port", port)

	// Start the web server
	err = http.ListenAndServe(fmt.Sprintf(":%d", port), app.routes())
	if err != nil {
		log.Fatal(err)
	}
}
