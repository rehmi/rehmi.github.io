+++
title = "HackMan 0.4"
project_date = "1995–1996"
tags = ["wearables", "computing", "hardware"]
project_thumb = "/assets/thumbnails/wearables-and-textiles/hackman/thumb.svg"
+++

# HackMan 0.4

![HackMan 0.4 system diagram: a 486SL single-board PC in a fanny pack driving a Private Eye heads-up display, typed with a Twiddler one-handed keyboard, powered by a 6-volt gel cell](system.svg)

## Overview

> "This is a Linux box that you can carry in a fanny pack."

HackMan 0.4 was Rehmi Post's self-built wearable computer, circa 1995–96 — a general-purpose PC
running Linux and DOS, packed into a converted Eagle Creek fanny pack and worn on the body,
driving a heads-up display and typed one-handed. It predates the smartphone era by more than a
decade: a full Linux workstation you carried on your hip and read through a monocle.

## System

Around a 25 MHz Intel 486SL single-board computer (an SMOS CARDIO-486), Rehmi built a complete
wearable:

| | |
|---|---|
| Operating system | Linux and DOS |
| Engine | 25 MHz Intel 486SL (SMOS CARDIO-486) with FPU |
| Memory | 8 kB cache · 256 kB flash ROM · 8 MB RAM |
| Storage | 1.0 GB 2.5″ Winchester (Quantum Europa 1080 AT) |
| Display | Phoenix Group Private Eye heads-up display |
| Keyboard | HandyKey Twiddler one-handed chording keyboard |
| Power | 6 V sealed lead-acid gel cell (10 W / 4 W / 3 W max/typ/min) |
| Size / weight | 35 × 140 × 180 mm · 615 g without battery, in a steel case |
| Cost | under \$3000 in over-the-counter parts |

Benchmarked over the net by Thad Starner at roughly 12,096 dhrystones/sec and 5 million
whetstones/sec — "about the speed of an SGI 4D/20 or an early Sparc 4/110" — and 12.52 BogoMips
under Linux.

## Hardware hacking

The build was full of period hardware craft:

- Rehmi tore open the sealed CARDIO-486 module "to get better coupling for conductive heat
  extraction."
- Hand-modified power management: a 1-farad supercapacitor for CMOS backup, a switching 3.3 V
  regulator swapped in for efficiency, and SMT transistors to power-gate the disk and ISA bus.
- Networking by SLIP over a serial port — limited by the CARDIO's 16450 UARTs (no FIFOs), but
  tuned to about 7.3 kB/s over FTP by adjusting the MTU.
- Powered from the gel cell through a Power Trends switching regulator (and, "sleazy but works,"
  sometimes straight off the cell).

The next revision was planned around a PC/104-less hand-wired bus and a "miniature geek port" — a
PIC microcontroller for generic digital and analog I/O.

## Wearable Waltz

The machine had its own signature demo — a short stop-motion film of the wearable taking itself
apart:

> "You can watch it disassemble itself in the silent classic, *Wearable Waltz*."

~~~
<video controls preload="metadata" style="max-width:100%;border-radius:10px;display:block;margin:2rem auto;">
  <source src="wearable-waltz.mp4" type="video/mp4">
  Your browser does not support the video tag &mdash; <a href="wearable-waltz.mp4">download the clip</a>.
</video>
~~~

## Context

HackMan 0.4 belongs to the mid-1990s MIT wearable-computing scene — see
[Wearable Computing](/projects/wearable-computing/) for the broader story. The original project
page was written by Rehmi at the MIT Media Lab in June 1996.

~~~
<figure style="max-width:200px;margin:2rem auto;text-align:center;">
  <img src="rehmi-wearable.jpg" alt="Rehmi wearing the HackMan rig, with the Private Eye heads-up display" style="width:100%;height:auto;border-radius:8px;">
  <figcaption style="font-size:0.85rem;color:var(--muted);margin-top:0.5rem;">Rehmi wearing HackMan, the Private Eye display over one eye (MIT Media Lab, ~1997).</figcaption>
</figure>
~~~
