# Development

## Target

The first target is x86_64 running inside QEMU.

VibeOS uses Buildroot to assemble a minimal Linux system, with the Linux kernel supplied by the selected Buildroot configuration.

## Host requirements

Build VibeOS from a Linux environment.

On Windows, WSL2 with Ubuntu is a convenient option. Keep the project inside the Linux filesystem for better build performance.

Required tools include:

- git
- make
- a C compiler/toolchain
- standard Buildroot host dependencies
- QEMU for running the generated image

Buildroot provides a host-dependency checker under `support/dependencies/dependencies.sh`.

## Buildroot version

The project currently targets **Buildroot 2026.08**, the current stable release.

The Buildroot source tree is not committed into this repository. The bootstrap script fetches the pinned version locally.

## First build

From the repository root:

```bash
bash scripts/bootstrap.sh
bash scripts/build.sh
```

The first build downloads the required toolchains and source packages, so it can take a while.

## Run

After a successful build:

```bash
bash scripts/run.sh
```

This launches the x86_64 image in QEMU.

## Generated files

Build output lives outside the repository source tree:

```
.buildroot/   Buildroot source
output/       Buildroot output
```

These generated directories should not be committed.

## Current rule

Do not optimize prematurely.

First make the minimal system boot reliably. Then measure CPU usage, memory use, boot time, idle behavior, and background activity before changing scheduling or power-management policy.
