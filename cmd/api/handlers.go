package main

import (
	"backend/internal/models"
	"context"
	"encoding/json"
	"fmt"
	"net/http"
)

func (app *application) Home(w http.ResponseWriter, r *http.Request) {
	var payload = struct {
		Status  string `json:"status"`
		Message string `json:"message"`
		Version string `json:"version"`
	}{
		Status:  "active",
		Message: "API up and running",
		Version: "1.0.0",
	}

	out, err := json.Marshal(payload)
	if err != nil {
		fmt.Println(err)
	}

	w.Header().Set("Content-Type", "application/json")
	w.WriteHeader(http.StatusOK)
	w.Write(out)
}

func (app *application) GetAllMovies(w http.ResponseWriter, r *http.Request) {
	query := `SELECT id, title, release_date, mpaa_rating, runtime, description, created_at, updated_at FROM movies`

	rows, err := app.DB.Query(context.Background(), query)
	if err != nil {
		http.Error(w, "Failed to fetch movies", http.StatusInternalServerError)
		return
	}
	defer rows.Close()

	var movies []models.Movie

	for rows.Next() {
		var movie models.Movie
		if err := rows.Scan(
			&movie.ID,
			&movie.Title,
			&movie.ReleaseDate,
			&movie.MPAARating,
			&movie.RunTime,
			&movie.Description,
			&movie.CreatedAt,
			&movie.UpdatedAt,
		); err != nil {
			http.Error(w, "Error processing movie data", http.StatusInternalServerError)
			return
		}
		movies = append(movies, movie)
	}

	response := struct {
		Movies []models.Movie `json:"movies"`
	}{
		Movies: movies,
	}

	respondWithJSON(w, http.StatusOK, response)
}

func (app *application) CreateMovie(w http.ResponseWriter, r *http.Request) {
	var movie models.Movie
	if err := json.NewDecoder(r.Body).Decode(&movie); err != nil {
		http.Error(w, "Invalid JSON input", http.StatusBadRequest)
		return
	}

	query := `
		INSERT INTO movies (title, release_date, mpaa_rating, run_time, description, created_at, updated_at)
		VALUES ($1, $2, $3, $4, $5, NOW(), NOW())
		RETURNING id
	`
	err := app.DB.QueryRow(
		context.Background(),
		query,
		movie.Title,
		movie.ReleaseDate,
		movie.MPAARating,
		movie.RunTime,
		movie.Description,
	).Scan(&movie.ID)
	if err != nil {
		http.Error(w, "Failed to create movie", http.StatusInternalServerError)
		return
	}

	respondWithJSON(w, http.StatusCreated, movie)
}

func (app *application) GetMovie(w http.ResponseWriter, r *http.Request) {
	id := r.URL.Query().Get("id")
	if id == "" {
		http.Error(w, "ID parameter is required", http.StatusBadRequest)
		return
	}

	var movie models.Movie
	query := `
		SELECT id, title, release_date, mpaa_rating, run_time, description, created_at, updated_at
		FROM movies WHERE id = $1
	`
	err := app.DB.QueryRow(context.Background(), query, id).Scan(
		&movie.ID,
		&movie.Title,
		&movie.ReleaseDate,
		&movie.MPAARating,
		&movie.RunTime,
		&movie.Description,
		&movie.CreatedAt,
		&movie.UpdatedAt,
	)
	if err != nil {
		http.Error(w, "Movie not found", http.StatusNotFound)
		return
	}

	respondWithJSON(w, http.StatusOK, movie)
}

func (app *application) DeleteMovie(w http.ResponseWriter, r *http.Request) {
	id := r.URL.Query().Get("id")
	if id == "" {
		http.Error(w, "ID parameter is required", http.StatusBadRequest)
		return
	}

	query := `DELETE FROM movies WHERE id = $1`
	_, err := app.DB.Exec(context.Background(), query, id)
	if err != nil {
		http.Error(w, "Failed to delete movie", http.StatusInternalServerError)
		return
	}

	w.WriteHeader(http.StatusNoContent)
}

func (app *application) UpdateMovie(w http.ResponseWriter, r *http.Request) {
	var movie models.Movie
	if err := json.NewDecoder(r.Body).Decode(&movie); err != nil {
		http.Error(w, "Invalid JSON input", http.StatusBadRequest)
		return
	}

	query := `
		UPDATE movies
		SET title = $1, release_date = $2, mpaa_rating = $3, run_time = $4, description = $5, updated_at = NOW()
		WHERE id = $6
	`
	_, err := app.DB.Exec(
		context.Background(),
		query,
		movie.Title,
		movie.ReleaseDate,
		movie.MPAARating,
		movie.RunTime,
		movie.Description,
		movie.ID,
	)
	if err != nil {
		http.Error(w, "Failed to update movie", http.StatusInternalServerError)
		return
	}

	w.WriteHeader(http.StatusNoContent)
}
