#!/usr/bin/env bash
# Needs an Apify API token (free account): export APIFY_TOKEN=...
set -euo pipefail

curl -sS -X POST \
  "https://api.apify.com/v2/acts/codepulsehq~speech-to-text-api/run-sync-get-dataset-items?token=${APIFY_TOKEN}" \
  -H "Content-Type: application/json" \
  -d '{"urls": ["https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3"], "language": "en", "estimateOnly": true}'
