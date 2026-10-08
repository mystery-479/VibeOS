# VibeOS

A minimal, efficiency-first Linux-based operating system project, built by vibe coding. 🐧

## Vision

VibeOS uses the Linux kernel as its foundation while building a deliberately small, fast, and understandable userland around it.

Core principles:

- Linux kernel instead of a custom kernel.
- Proper multitasking and responsive foreground workloads.
- Dynamic resource and power management.
- Background work should yield when the system is busy.
- No animations or unnecessary visual effects in the early versions.
- Minimal services and minimal bloat.
- Every major component should have a clear reason to exist.

## Current Status

**Phase:** 0 — Project bootstrap

The repository now contains the project specification, architecture notes, and the first reproducible Buildroot/QEMU development scripts.

### First milestone

Boot a minimal VibeOS image in QEMU and reach a working shell.

Target flow:

```
Firmware / Boot
      |
      v
Linux kernel
      |
      v
Minimal root filesystem
      |
      v
VibeOS userland
      |
      v
Shell
```

## Resource Philosophy

VibeOS does not try to give every process a fixed amount of "energy."

Instead, it will use Linux mechanisms such as CPU scheduling, CPU frequency scaling, CPU idle states, I/O priorities, and resource controls so the machine does useful work without wasting resources.

The intended behavior is:

```
Interactive work  ->  responsive
Background work   ->  restrained
Idle system      ->  low-power
Unnecessary work ->  avoided
```

## Roadmap

### v0.1 — Boot
- Build a minimal Linux-based image with Buildroot 2026.08.
- Boot it in QEMU.
- Reach a shell.
- Verify basic CPU, memory, process, and filesystem behavior.

### v0.2 — Efficiency
- Remove unnecessary services.
- Configure CPU frequency and idle-state behavior.
- Tune scheduling and I/O priorities.
- Add lightweight process/resource policies.

### v0.3 — Userland
- Build a simple VibeOS shell.
- Add small system utilities.
- Keep the default environment minimal.

### Later
- Filesystem and package management improvements.
- Networking.
- Hardware support.
- A simple desktop environment with no unnecessary animation.

## Development

Early development uses:

- Linux kernel
- Buildroot 2026.08
- QEMU
- C and shell scripting where appropriate

Physical hardware is **not** the starting point. VibeOS will be developed and tested in a virtual machine first.

See [Development](docs/development.md) for setup and build commands.

## Repository Layout

```
README.md               Project overview and roadmap
docs/architecture.md   System architecture and design principles
docs/development.md    Build and development instructions
scripts/                Bootstrap, build, and QEMU launch helpers
```

This repository is the source of truth for the project. Major design and implementation decisions should be documented here as VibeOS evolves.

---

Early project. Expect bugs, weird ideas, and questionable shell commands. 💀
