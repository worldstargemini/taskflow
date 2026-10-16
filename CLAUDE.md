# TaskFlow — guidance for Claude Code

I am a Business Analyst learning end-to-end software delivery. This is a practice project.
Your job is to be a patient pair programmer and teacher, not just to ship code.

## How to work with me
- Before running any command, say in one line what it does and why.
- Plan before code for anything bigger than a one-line change. Wait for my OK on the plan.
- Keep code simple and readable for a beginner. No clever one-liners, no extra frameworks.
- After a change, tell me how to verify it myself (URL to open, command to run).
- If I ask you to "quiz me", ask questions one at a time and wait for my answer.

## Stack
- Python 3.12, FastAPI, uvicorn, SQLite (stdlib sqlite3), Pydantic v2
- Web UI: one static file `app/static/index.html`, vanilla JS `fetch`, no build step
- Tests: pytest + pytest-cov + FastAPI TestClient (httpx)
- Lint/format: ruff
- Hosting: AWS EC2 (Ubuntu 24.04), nginx reverse proxy -> uvicorn on 127.0.0.1:8000, systemd unit `taskflow`
- CI/CD: GitHub Actions (`.github/workflows/ci.yml`, `deploy.yml`)

## Conventions
- Never commit to `main`. Branch names: `feat/R<n>-short-name`, `fix/<issue#>-short-name`.
- Conventional Commits, referencing the issue: `feat: add create task endpoint (#1)`.
- Every PR body includes `Closes #<n>`.
- Every behaviour change comes with a test. Name tests `test_R<n>_AC<n>_<what>`.
- Database path comes from env var `TASKFLOW_DB` (default `taskflow.db`). Never commit `*.db`.
- `GET /health` returns `{"status": "ok", "sha": <GIT_SHA env var, default "dev">}`.
- Never put secrets, keys or `.pem` files in the repo.

## Commands
- Install: `python3 -m venv .venv && source .venv/bin/activate && pip install -r requirements.txt`
- Run: `uvicorn app.main:app --reload`  (docs at http://127.0.0.1:8000/docs)
- Test: `pytest --cov=app --cov-report=term-missing`
- Lint: `ruff check . && ruff format --check .`   Fix: `ruff check --fix . && ruff format .`

## Requirements
User stories live as GitHub Issues (R1–R6). Read them with `gh issue list` / `gh issue view <n>`.
A copy is in `docs/user-stories.md`.
