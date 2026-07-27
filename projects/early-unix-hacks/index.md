+++
title = "Early Unix Hacks"
project_date = "1982–1985"
tags = ["computing"]
project_thumb = "/assets/thumbnails/other/early-unix-hacks/thumb.jpg"
+++

# Early Unix Hacks

~~~
<div style="background:#0e0b12;border-radius:10px;padding:1.5rem 1.7rem;margin:2rem 0;font-family:'Menlo','SFMono-Regular','Consolas',monospace;font-size:0.98rem;line-height:1.75;color:#ece9f0;overflow-x:auto;">
  <div><span style="color:#e6b48c;">%</span> latex thesis.tex</div>
  <div><span style="color:#e6b48c;">^T</span></div>
  <div>up 2h&nbsp;16m &nbsp;&nbsp; load&nbsp;6.20&nbsp;4.19 &nbsp;&nbsp; %cpu&nbsp;0.07 &nbsp;&nbsp; 6k&nbsp;of&nbsp;47k &nbsp;&nbsp; kbd&nbsp;wait</div>
  <div><span style="color:#e6b48c;">%</span>&nbsp;<span style="background:#ece9f0;color:#0e0b12;">&nbsp;</span></div>
</div>
~~~

*The `^T` status line, recreated — a live one-line system report summoned straight from the terminal driver (1985).*

## Overview

Two small systems hacks from the early 1980s, posted to the Usenet group `net.unix-wizards` from the
University of Maryland, College Park. One exposed a hole in how Unix guarded kernel memory and helped
get it closed; the other borrowed a convenience from TOPS-20 and stitched it into the BSD terminal
driver. The code itself is long gone — the archived postings are the record.

## A keystroke snooper that hardened `/dev/kmem` (1982)

In December 1982 a short program went out to `net.unix-wizards` under the subject line
**"I felt slightly obnoxious, so…."** It read another user's terminal input — the raw `clist`/`cblock`
buffers the kernel used to hold typed characters — straight out of kernel memory through `/dev/kmem`,
which on the Unix systems of the day was world-readable. By reassembling those buffers it could
reconstruct whatever someone else was typing at their terminal, passwords included: the `login`
program's `getpass()` did nothing to hide the keystrokes from a reader with access to kernel memory.

The point was never the snooping; it was the hole it made obvious. Within days, **Jay Lepreau** at the
University of Utah replied in the same thread (12 December 1982):

> It was only a matter of time till one of these became widely available. Ok, so we finally must do
> what we should have long ago: protect mem/kmem & make all the mem pgms setgid or uid.

He went on to name the memory-reading utilities — `ps`, `w`, `vmstat`, `pstat` and their kin — that
would have to become `setgid` so that `/dev/mem` and `/dev/kmem` could finally be read-protected in
future distributions. That is roughly what came to pass: world-readable kernel memory was locked down,
and the tools that genuinely needed it were made privileged. A hole closed because someone made it too
easy to ignore.

## A twenex-style `^T` for the BSD tty driver (1985)

In March 1985 came **"inexpensive twenex-style ^T for 4.2 (and 4.1)"** — a patch to the 4.1/4.2BSD
terminal driver, with a few patches to `stty` alongside. It borrowed the `^T` (Ctrl-T) convention from
TOPS-20 (TWENEX): pressing `^T` at the terminal, when not in raw mode, printed a live one-line status
report of the system and the current job. The example from the posting:

> up 2h 16m, load 6.20 4.19, %cpu 0.07, 6k of 47k, kbd wait

The output format was configurable, extra meters could be added, and the trigger key reassigned. It is
the same idea — a status line summoned from the terminal driver — that later became the familiar BSD
**`^T` / `SIGINFO`** feature, where a keystroke prints the load average and the foreground process's
state. (Whether this patch is an ancestor of that feature or a parallel take on the same TWENEX idea
isn't documented, so no lineage is claimed here.)

## Context

Both date from an early stretch of Unix systems hacking at Maryland — the same College Park years as
the ZMOB parallel-processing work — posted under the handle "Khron The Elder" to a `net.unix-wizards`
readership that took in much of the era's BSD community. Minor artifacts, but honest ones: a security
curiosity that helped close a real hole, and a terminal convenience the system later caught up to.

## Sources

- **"I felt slightly obnoxious, so…."** — `net.unix-wizards`, 6 Dec 1982 (Khron The Elder / E. Rehmi
  Post, `rehmi.umcp-cs`).
  [Google Groups thread](https://groups.google.com/g/net.unix-wizards/c/wYHgahJ8DhA/m/esTjEAgATlsJ)
- **Reply on protecting `mem`/`kmem`** — J. Lepreau (`utah-cs!lepreau`), `net.unix-wizards`,
  12 Dec 1982. [Google Groups thread](https://groups.google.com/g/net.unix-wizards/c/wYHgahJ8DhA)
- **"inexpensive twenex-style ^T for 4.2 (and 4.1)"** — `net.unix-wizards`, 28 Mar 1985 (Rehmi Post).
  [Google Groups post](https://groups.google.com/g/net.unix-wizards/c/wt3mEa_KhFg/m/rM6F4uDL4UgJ)
