#!/usr/bin/env bash
# Runs ON the EC2 instance. Manually (Phase 6.1) or from GitHub Actions over SSH (Phase 6.2).
set -euo pipefail

APP_DIR=/opt/taskflow
cd "$APP_DIR"

echo "==> Fetching latest main"
git fetch origin main
git reset --hard origin/main      # server always matches main exactly; untracked/ignored files (db, .env) are kept

echo "==> Installing dependencies"
.venv/bin/pip install --quiet -r requirements.txt

echo "==> Recording commit SHA"
echo "GIT_SHA=$(git rev-parse --short HEAD)" > .env

echo "==> Restarting service"
sudo systemctl restart taskflow
sleep 3

echo "==> Smoke test"
curl -fsS http://127.0.0.1/health
echo
echo "==> Deployed $(git rev-parse --short HEAD)"
