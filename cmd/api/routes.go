package main

import (
	"net/http"

	"github.com/go-chi/chi/v5"
	"github.com/go-chi/chi/v5/middleware"
)

func (app *application) routes() http.Handler {
	// create a router mux
	mux := chi.NewRouter()

	mux.Use(middleware.Recoverer)

	mux.Use(app.enableCORS)

	mux.Get("/", app.Home)

	mux.Get("/movies", app.GetAllMovies)

	mux.Post("/movies/create", app.CreateMovie)
	mux.Get("/movies/get", app.GetMovie)
	mux.Put("/movies/update", app.UpdateMovie)
	mux.Delete("/movies/delete", app.DeleteMovie)

	return mux
}
