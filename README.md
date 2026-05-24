# Flutter + Django Development Template

Flutter frontend + Django REST backend + PostgreSQL + Docker による
クロスプラットフォーム開発テンプレート。

---

# Features

- Flutter frontend
- Django REST backend
- PostgreSQL
- Docker Compose
- DevContainer
- VSCode Workspace
- Environment Variables (.env)
- PowerShell startup scripts

---

# Project Structure

```text
PlanMark_app/
├─ frontend/           # Flutter
├─ backend/            # Django
├─ scripts/            # PowerShell scripts
├─ .devcontainer/
├─ .vscode/
├─ docker-compose.yml
├─ .env.example
└─ README.md
```

---

# Requirements

- Docker Desktop
- Flutter SDK
- VSCode
- PowerShell

Recommended VSCode Extensions:

- Dev Containers
- Docker
- Flutter
- Dart
- Python

---

# Initial Setup

## 1. Clone

```powershell
git clone <repository>
```

---

## 2. Create .env

Copy:

```text
.env.example
↓
.env
```

---

## 3. Backend Start

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\start_backend.ps1
```

---

## 4. Frontend Start

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\start_frontend.ps1
```

---

# Backend URLs

```text
http://localhost:8000/admin/
http://localhost:8000/api/
```

---

# DevContainer

Open VSCode:

```text
Ctrl + Shift + P
↓
Dev Containers: Reopen in Container
```

---

# Environment Variables

## Backend

```env
DB_ENGINE=
DB_NAME=
DB_USER=
DB_PASSWORD=
DB_HOST=
DB_PORT=
```

## Frontend

```env
API_BASE_URL=
```

---

# Database

PostgreSQL runs inside Docker.

Migration:

```powershell
docker compose exec backend python manage.py migrate
```

Create Admin User:

```powershell
docker compose exec backend python manage.py createsuperuser
```

---

# Purpose

This repository is intended as a reusable development template for:

- Inspection systems
- Map systems
- Report systems
- Offline-capable apps
- Flutter + Django projects

---

# Future Extensions

- JWT Authentication
- Offline Sync
- Redis
- Celery
- Nginx
- CI/CD
- Tile Map Rendering
- AI Integration