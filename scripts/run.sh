#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
IMAGE_DIR="${ROOT_DIR}/output/images"

if [[ ! -f "${IMAGE_DIR}/bzImage" ]]; then
    echo "error: ${IMAGE_DIR}/bzImage not found."
    echo "run: bash scripts/build.sh"
    exit 1
fi

if [[ ! -f "${IMAGE_DIR}/rootfs.ext2" ]]; then
    echo "error: ${IMAGE_DIR}/rootfs.ext2 not found."
    echo "run: bash scripts/build.sh"
    exit 1
fi

if ! command -v qemu-system-x86_64 >/dev/null 2>&1; then
    echo "error: qemu-system-x86_64 is required."
    exit 1
fi

exec qemu-system-x86_64 \
    -M pc \
    -m 512M \
    -smp 2 \
    -kernel "${IMAGE_DIR}/bzImage" \
    -drive "file=${IMAGE_DIR}/rootfs.ext2,format=raw,if=virtio" \
    -append "root=/dev/vda console=ttyS0" \
    -nographic
