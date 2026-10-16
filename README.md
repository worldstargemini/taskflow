# TaskFlow

A small task tracker (FastAPI + SQLite + a vanilla JS page) built as an end-to-end SDLC practice project:
plan -> build -> test -> deploy to AWS EC2 -> CI/CD with GitHub Actions -> operate.

## Run locally
```bash
python3 -m venv .venv && source .venv/bin/activate
pip install -r requirements.txt
uvicorn app.main:app --reload
```
Open http://127.0.0.1:8000/ (UI) and http://127.0.0.1:8000/docs (API).

## Test
```bash
pytest --cov=app --cov-report=term-missing
ruff check . && ruff format --check .
```

## Deploy
See `deploy/` — `taskflow.service` (systemd), `nginx-taskflow.conf`, `deploy.sh`,
and the workflow files `ci.yml` / `deploy.yml` to copy into `.github/workflows/` (Phases 4 and 6).
