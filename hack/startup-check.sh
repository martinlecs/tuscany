#!/usr/bin/env bash

set -euo pipefail

# Check for nix
if ! command -v nix >/dev/null 2>&1; then
    echo "❌ nix is not installed. Please install nix first." >&2
    exit 1
fi

# Check for docker
if ! command -v docker >/dev/null 2>&1; then
    echo "❌ docker is not installed or not in PATH." >&2
    exit 1
fi

# Check if docker daemon is running
if ! docker info >/dev/null 2>&1; then
    echo "❌ Docker daemon is not running or you don't have permission to access it." >&2
    exit 1
fi

echo "✅ Environment setup!"
