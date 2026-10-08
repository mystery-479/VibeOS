# Development

## Target

The first target is x86_64 running inside QEMU.

VibeOS is currently built with Buildroot while using the Linux kernel supplied by the Buildroot configuration.

## Host requirements

Build VibeOS from a Linux environment.

A Windows host can use WSL2 with an Ubuntu distribution or a Linux virtual machine. Keep the project inside the Linux filesystem for better build performance.

Required tools include:

- git
- make
- a C compiler/toolchain
- standard Buildroot host dependencies
- QEMU for running the generated image

Buildroot itself provides a `support/dependencies/dependencies.sh` helper for checking host dependencies.

## Buildroot version

The project currently targets **Buildroot 2026.08**.

Do not commit the Buildroot source tree into this repository. The bootstrap script downloads/clones the pinned version locally.

## First build

From the repository root:

```bash
./scripts/bootstrap.sh
```

Then:

```bash
./scripts/build.sh
```

The first build downloads the required toolchains and source packages, so it can take a while.

## Run

After a successful build:

```bash
./scripts/run.sh
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

First make the minimal system boot reliably. Then measure CPU, memory, boot time, idle behavior, and background activity before changing scheduling or power-management policy.
