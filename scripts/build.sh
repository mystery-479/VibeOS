#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
BUILDROOT_DIR="${ROOT_DIR}/.buildroot"

if [[ ! -d "${BUILDROOT_DIR}" ]]; then
    echo "error: Buildroot is not bootstrapped."
    echo "run: ./scripts/bootstrap.sh"
    exit 1
fi

echo "==> Building VibeOS"
make -C "${BUILDROOT_DIR}" O="${ROOT_DIR}/output"

echo
echo "Build complete."
echo "Image directory: ${ROOT_DIR}/output/images"
