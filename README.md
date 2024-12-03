# 🎬 Go Movies Backend

## Overview

A sleek and efficient Go backend application for managing movies, powered by PostgreSQL and designed for seamless development experience.

![Go Version](https://img.shields.io/badge/Go-1.20+-blue.svg)
![PostgreSQL](https://img.shields.io/badge/PostgreSQL-13+-green.svg)
![License](https://img.shields.io/badge/License-MIT-yellow.svg)

## ✨ Features

- **🚀 Fast Development**: Utilizes `fresh` for automatic server reloading
- **🗃️ Robust Database**: Seamless PostgreSQL integration
- **🔧 CRUD Operations**: Complete movie management functionality
- **🐳 Docker Support**: Easy containerization and local development

## 🛠 Prerequisites

Before you begin, ensure you have the following installed:

- **Docker** 🐳 - For containerizing the PostgreSQL database
- **Go** 🟢 - Programming language runtime
- **Fresh** 🔄 - Development server with auto-restart capability

## 🚦 Quick Start Guide

### 1. Clone the Repository

```bash
git clone https://github.com/tundx0/go-movies-backend.git
cd go-movies-backend
```

### 2. Set Up PostgreSQL Database

Use Docker Compose to spin up the database:

```bash
docker-compose up -d
```

### 3. Install Go Dependencies

```bash
go mod tidy
```

### 4. Install Fresh for Auto-Restart

```bash
go install github.com/gravityblast/fresh@latest
```

### 5. Configure Database Connection

Edit the database connection settings in `./cmd/api/main.go` if needed. Default configuration supports local PostgreSQL setup.

### 6. Start the Application

```bash
fresh -c ./cmd/api/fresh.conf
```

### 7. Access the Application

The server will be available at:
```
http://localhost:8080
```

## 🌐 API Endpoints

Explore the various endpoints for movie management:

- `GET /movies` - Retrieve all movies
- `GET /movies/{id}` - Get a specific movie
- `POST /movies` - Create a new movie
- `PUT /movies/{id}` - Update an existing movie
- `DELETE /movies/{id}` - Remove a movie

## 🛑 Stopping the Application

To stop the application and remove the PostgreSQL container:

```bash
docker-compose down
```
