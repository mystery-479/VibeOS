#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
BUILDROOT_DIR="${ROOT_DIR}/.buildroot"
OUTPUT_DIR="${ROOT_DIR}/output"
IMAGE_DIR="${OUTPUT_DIR}/images"
JOBS="${VIBEOS_JOBS:-$(nproc)}"

if [[ ! -d "${BUILDROOT_DIR}" ]]; then
    echo "error: Buildroot is not bootstrapped."
    echo "run: ./scripts/bootstrap.sh"
    exit 1
fi

if [[ ! -f "${OUTPUT_DIR}/.config" ]]; then
    echo "error: Buildroot configuration is missing."
    echo "run: ./scripts/bootstrap.sh"
    exit 1
fi

echo "==> Building VibeOS with ${JOBS} job(s)"

make -C "${BUILDROOT_DIR}" O="${OUTPUT_DIR}" -j"${JOBS}"

echo
echo "==> Verifying build artifacts"

if [[ ! -f "${IMAGE_DIR}/bzImage" ]]; then
    echo "error: build returned successfully, but bzImage was not generated."
    echo "inspect: ${IMAGE_DIR}"
    exit 1
fi

if [[ ! -f "${IMAGE_DIR}/rootfs.ext2" ]]; then
    echo "error: build returned successfully, but rootfs.ext2 was not generated."
    echo "inspect: ${IMAGE_DIR}"
    exit 1
fi

echo
echo "VibeOS build complete."
echo "Kernel: ${IMAGE_DIR}/bzImage"
echo "RootFS: ${IMAGE_DIR}/rootfs.ext2"
echo "Kernel size: $(du -h "${IMAGE_DIR}/bzImage" | cut -f1)"
echo "RootFS size: $(du -h "${IMAGE_DIR}/rootfs.ext2" | cut -f1)"
