#!/usr/bin/env bash

set -euo pipefail

URL="${1:-http://localhost:8080}"

echo "Checking application: $URL"

if HTTP_CODE=$(curl -sS -o /dev/null -w "%{http_code}" "$URL"); then
    if [ "$HTTP_CODE" = "200" ]; then
        echo "Healthcheck passed: HTTP $HTTP_CODE"
        exit 0
    fi

    echo "Healthcheck failed: HTTP $HTTP_CODE"
    exit 1
else
    echo "Healthcheck failed: Unable to reach $URL"
    exit 1
fi