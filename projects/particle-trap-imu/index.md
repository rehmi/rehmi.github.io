+++
title = "Particle Trap IMU"
project_date = "2003"
tags = ["inertial-sensing", "sensors"]
project_thumb = "/assets/thumbnails/inertial-sensing/particle-trap-imu/thumb.jpg"
+++

# Particle Trap IMU

![LEGO prototype of the Particle Trap IMU](01.Lego-IMU.jpg)

## Overview

Miniature motion sensors are everywhere these days, detecting the orientation of cell phones, deploying air bags in cars and measuring stresses in buildings and mechanical systems. But manufacturing the sensors' tiny moving parts requires the same high-tech, billion-dollar facilities that churn out computer chips.

## The instrument

The doctoral work took a different route: a sensor consisting of a tiny metal bead suspended in a hole drilled in a circuit board. A fluctuating electric field holds the bead aloft in a tight orbit, and disturbances of the orbit indicate the sensor's direction of motion and rotation. Instead of micromechanical systems, this is a *microdynamical* one — the dynamics of a simple physical system stand in for precisely micromachined moving parts, and the same approach extends to measuring sound, pressure, fluid flow, and magnetic fields.

![Laboratory setup of the Particle Trap IMU](02.Lab_Bench.jpg)

## Technical Details

This device can do the work of at least six different micromechanical sensors. It can measure acceleration in three dimensions, which would ordinarily require three accelerometers. But it can also gauge orientation, which would usually require an additional three gyroscopes.

At the sensor's heart is a particle trap, a device commonly used in experimental physics. Physically, the trap is very simple: two metal plates on either side of a circuit board, with a hole about the diameter of an electrical wire drilled through them. But a computer circuit hooked up to the plates exerts precise control over the electric field they produce.

## Working Principle

The electric field can be thought of as saddle-shaped:
- Front to back, it curves upward at the ends
- Side to side, it curves downward
- The field fluctuates as if it were rotating

A particle at its center is like a marble on a warped turntable. The marble starts to roll down one of the downward slopes, but the turntable revolves, and the marble finds itself rolling up an uphill slope instead. When it falls back down the slope, it repeats the whole process on the opposite side of the turntable, and so on.

A particle in the trap is thus not perfectly still but rapidly oscillating as, in effect, it rolls back and forth between upward slopes. Each of the six types of motion detected by a complete set of accelerometers and gyros disturbs the particle in a distinctive way.

In the published measurements, the acceleration noise expected from the trap's dynamics was on the order of 812 μg rms; integrating the observed noise density gave 684 μg — in good agreement, and comparable in sensitivity to commercial MEMS devices of the day.

## Reception

As noted by Michael Judy, a researcher at Analog Devices (the company that built the Wii's accelerometers): "If [we] can get all six degrees out of it, it would be huge. That's the holy grail right now in the human interface to electronics." 

The same measurement could serve navigation where GPS is unreliable or too coarse — local spatial tracking that lets hospital workers find each other immediately, even on different floors of a large building.

## Publications

- [**Inertial Measurement with Trapped Particles: A Microdynamical System**](/assets/pdf/APL143501.pdf), E. R. Post, G. A. Popescu, N. Gershenfeld, *Applied Physics Letters* **96**, 143501 (2010).
- [**Inertial Measurement via Dynamics of Trapped Particles**](/assets/pdf/post-phd-dissertation-2003.pdf) — PhD dissertation, MIT, 2003.

## Related Work

- [MEMS Interferometric Accelerometer](/projects/mems-accelerometer/)
- [Haltere IMU](/projects/haltere-imu/)