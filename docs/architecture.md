# VibeOS Architecture

## Goal

Build a minimal Linux-based operating system environment focused on responsiveness, low unnecessary resource usage, and an understandable architecture.

## High-Level Architecture

```
Hardware
   |
Linux kernel
   |
System services
   |
VibeOS userland
   |
Applications
```

The Linux kernel handles low-level operating-system responsibilities such as process scheduling, virtual memory, device drivers, networking primitives, and hardware power-management interfaces.

VibeOS focuses primarily on system configuration, resource policy, userland, and the overall system experience.

## Resource Philosophy

"Enough resources to get the job done" does not mean assigning a fixed energy budget to every process.

Instead, VibeOS will use Linux mechanisms including:

- CPU scheduling and priorities
- CPU frequency scaling
- CPU idle states
- I/O priorities
- process resource controls
- service startup and shutdown policy

The intended behavior is:

1. Interactive work should remain responsive.
2. Background work should consume fewer resources when possible.
3. An idle machine should be able to enter low-power states.
4. Unnecessary always-on services should be avoided.

## Multitasking

Linux already provides preemptive multitasking. VibeOS will tune the existing mechanisms rather than replace the kernel scheduler with a custom implementation.

Foreground applications should receive appropriate responsiveness while background tasks are allowed to yield resources.

## UI Philosophy

The first versions intentionally avoid animations and visual effects.

For now:

```
action -> result
```

not:

```
action -> animation -> result
```

A graphical environment can be added later without changing the core principles.

## Testing

QEMU is the initial development target because it allows rapid rebuild/reboot cycles without risking the host machine.
