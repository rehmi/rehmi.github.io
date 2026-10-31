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

*The `^T` status line, recreated — a live one-line system report summoned straight from the terminal driver. The output line is the example from the March 1985 posting.*

## Overview

Two small systems hacks from the early 1980s, posted to Usenet from the University of Maryland,
College Park. One exposed a hole in how Unix guarded kernel memory and helped get it closed; the
other borrowed a convenience from TOPS-20 and stitched it into the BSD terminal driver. Both
survive: the original postings are archived below, and so are the complete kernel patches for the
second, as they went out on `net.sources` in 1985.

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

## A twenex-style `^T` for the BSD tty driver (1983–1985)

The idea comes from TOPS-20 (TWENEX): press `^T` (Ctrl-T) at the terminal, when not in raw mode,
and the system prints a one-line report on itself and on the job in the foreground. The BSD version
began as a hook in the 4.1BSD terminal driver. The revision log at the head of the patched `tty.c`
opens with the entry

> print out primitive system stats (for now) rehmi 18 Apr 83

and over the next sixteen months records clearer statistics, a shorter message, priorities on
process states, and one-second timeouts, with a few fixes signed by colleagues ("chris", "james").
In August 1984 the code moved twice in a week: to Pyramid's dual-universe OSx on 5 August, and from
there to BRL's 4.2BSD on the Vax on 10 August.

In March 1985 a short note to `net.unix-wizards` (itself a repost) offered it by mail, with an
example of the output:

> up 2h 16m, load 6.20 4.19, %cpu 0.07, 6k of 47k, kbd wait

The patch is small and touches only the terminal code: a `USESTAT` compile option, a new
`t_usest` character in the tty structure (so the trigger key can be reassigned like any other), and
a `ttystatout()` routine in `tty.c` that composes the report. Eleven meters can be switched on or
off per terminal through `stty` — the 1-, 5- and 15-minute load averages, uptime, the process-group
leader and its children, their CPU share (raw or cooked), their size and resident set, their
flags, and a rough state. The state is the most telling one across the whole foreground process
group, ranked in a small priority table: "kbd wait" (asleep on the terminal's own input queue)
outranks "running", which outranks "idling", "waiting", "swapped", "stopped", and "zombied".
"Losing" is held in reserve for when no process turns up at all.

In June 1985 Chris Torek, also of the Maryland computer science department, posted the full kernel
and `stty` changes to `net.sources` in three versions — 4.1BSD, 4.2BSD on the Vax, and the Pyramid
kernel — and announced them in `net.unix-wizards` as "our (Rehmi's really) kernel & stty mods."
His preface to the patches puts it plainly:

> Most of the code was written by Rehmi Post (who also made up the diff listings).

Those postings are why the code survives at all. The same idea — a status line summoned from the
terminal driver — later became the familiar BSD **`^T` / `SIGINFO`** feature, where a keystroke
prints the load average and the foreground process's state. Whether this patch is an ancestor of
that feature or a parallel take on the same TWENEX idea isn't documented, so no lineage is claimed
here.

## Context

Both date from an early stretch of Unix systems hacking at Maryland — the same College Park years as
the ZMOB parallel-processing work — posted under the handle "Khron The Elder" and later under his own
name to a `net.unix-wizards` readership that took in much of the era's BSD community. Minor
artifacts, but honest ones: a security curiosity that helped close a real hole, and a terminal
convenience the system later caught up to.

## Sources and archived copies

Each posting links to Google Groups, with a verbatim local copy alongside in case that link ever goes
dead. Dates are as Google Groups displays them.

**`/dev/kmem` (1982)**
- **"I felt slightly obnoxious, so…."** — Khron The Elder (`rehmi.umcp-cs`), `net.unix-wizards`,
  10 Dec 1982 (message dated 6 Dec).
  [Google Groups](https://groups.google.com/g/net.unix-wizards/c/wYHgahJ8DhA/m/esTjEAgATlsJ) ·
  [local copy](usenet/1982-12-i-felt-slightly-obnoxious.txt)
- **Reply on protecting `mem`/`kmem`** — J. Lepreau (`utah-cs!lepreau`), `net.unix-wizards`,
  12 Dec 1982.
  [Google Groups](https://groups.google.com/g/net.unix-wizards/c/wYHgahJ8DhA/m/q05fxlk1MQQJ) ·
  [local copy](usenet/1982-12-lepreau-protect-kmem.txt)

**`^T` (1985)**
- **"inexpensive twenex-style ^T for 4.2 (and 4.1)"** — Rehmi Post, `net.unix-wizards`,
  28 Mar 1985.
  [Google Groups](https://groups.google.com/g/net.unix-wizards/c/wt3mEa_KhFg/m/rM6F4uDL4UgJ) ·
  [local copy](usenet/1985-03-twenex-style-ctrl-t.txt)
- **"Twenex-Like ^T code posted to net.sources"** — Chris Torek, `net.unix-wizards`, 19 Jun 1985.
  [Google Groups](https://groups.google.com/g/net.unix-wizards/c/Hyh6VJ033JI/m/q3EuqPHgZgMJ) ·
  [local copy](usenet/1985-06-torek-ctrl-t-posted.txt)

**The patches** — posted by Chris Torek to `net.sources`, 19 Jun 1985: kernel diffs for `tty.h`,
`ttychars.h`, `ioctl.h` and `tty.c`, plus the matching `stty` changes.
- **4.1BSD** — [Google Groups](https://groups.google.com/g/net.sources/c/lPpvF_3sC2o/m/3D9bkufBBBUJ) ·
  [local copy](usenet/1985-06-usestat-patch-4.1bsd.txt)
- **4.2BSD Vax** — [Google Groups](https://groups.google.com/g/net.sources/c/BfyFp1p_-t0/m/jbKhhVGQKhsJ) ·
  [local copy](usenet/1985-06-usestat-patch-4.2bsd-vax.txt)
- **Pyramid kernel** — [Google Groups](https://groups.google.com/g/net.sources/c/VKBnM6hIPRU/m/O5UwiKoXnIAJ) ·
  [local copy](usenet/1985-06-usestat-patch-pyramid.txt)
