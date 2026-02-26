#!/usr/bin/env bash
set -euo pipefail

REPO_URL="https://github.com/sasanquaa/komari.git"
TMP_DIR="$(mktemp -d)"

cleanup() {
  rm -rf "$TMP_DIR"
}
trap cleanup EXIT

git clone "$REPO_URL" "$TMP_DIR/komari"

# Copy source into current repository root (except upstream .git metadata).
rsync -a --delete \
  --exclude '.git' \
  --exclude '.github' \
  "$TMP_DIR/komari/" "./"

echo "Imported $REPO_URL into $(pwd)"
