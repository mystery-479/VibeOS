#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
BUILDROOT_VERSION="2026.08"
BUILDROOT_DIR="${ROOT_DIR}/.buildroot"

for cmd in git make bc; do
    if ! command -v "${cmd}" >/dev/null 2>&1; then
        echo "error: ${cmd} is required"
        if [[ "${cmd}" == "bc" ]]; then
            echo "install on Kali/Debian: sudo apt install -y bc"
        fi
        exit 1
    fi
done

if [[ ! -d "${BUILDROOT_DIR}/.git" ]]; then
    echo "==> Cloning Buildroot ${BUILDROOT_VERSION}"
    git clone --depth 1 --branch "${BUILDROOT_VERSION}" \
        https://gitlab.com/buildroot.org/buildroot.git "${BUILDROOT_DIR}"
else
    echo "==> Buildroot already present: ${BUILDROOT_DIR}"
fi

echo "==> Preparing QEMU x86_64 configuration"
make -C "${BUILDROOT_DIR}" O="${ROOT_DIR}/output" qemu_x86_64_defconfig

echo
echo "Bootstrap complete."
echo "Next: ./scripts/build.sh"
