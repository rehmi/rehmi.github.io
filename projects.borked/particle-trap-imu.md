+++
title = "Particle Trap IMU"
project_date = "2003"
tags = ["inertial-sensing", "sensors", "hardware", "archive"]
+++

# Particle Trap IMU

{{showtags}}

\toc

## Overview

Miniature motion sensors are everywhere these days, detecting the orientation of cell phones, deploying air bags in cars and measuring stresses in buildings and mechanical systems. But manufacturing the sensors' tiny moving parts requires the same high-tech, billion-dollar facilities that churn out computer chips.

To address this need, this PhD research developed a sensor consisting of a tiny metal bead suspended in a hole drilled in a circuit board. A fluctuating electric field holds the bead aloft in a tight orbit, and disturbances of the orbit indicate the sensor's direction of motion and rotation.

This sensor opens the door to a new class of miniaturized devices that exploit the dynamics of simple physical systems instead of the mechanical interactions of precisely micromachined parts. Such "microdynamical" devices could enable cheaper, simpler, more responsive sensors for a range of applications, including the measurement of sound, pressure, fluid-flow and magnetic fields.

## Technical Innovation

This device can do the work of at least six different micromechanical sensors. It can measure acceleration in three dimensions, which would ordinarily require three accelerometers. But it can also gauge orientation, which would usually require an additional three gyroscopes.

As Michael Judy, a researcher at Analog Devices (the company that built the Wii's accelerometers) noted: "If [we] can get all six degrees out of it, it would be huge. That's the holy grail right now in the human interface to electronics." The application of motion sensing that has sparked the most interest is navigation in environments where GPS information is either unreliable or too imprecise. For instance, local spatial tracking would let hospital workers immediately determine each other's locations, even on different floors of a large building.

## Technical Details

### Particle Trap Design
At the sensor's heart is a particle trap, a device commonly used in experimental physics. Physically, the trap is very simple:
- Two metal plates on either side of a circuit board
- A hole about the diameter of an electrical wire drilled through them
- Computer circuit hooked up to the plates for precise control over the electric field

### Operating Principle
The electric field can be thought of as saddle-shaped:
- Front to back, it curves upward at the ends
- Side to side, it curves downward
- The field fluctuates as if it were rotating

A particle in the trap is like a marble on a warped turntable:
1. The marble starts to roll down one of the downward slopes
2. The turntable revolves, and the marble finds itself rolling up an uphill slope
3. When it falls back down the slope, it repeats the process on the opposite side
4. This creates a rapid oscillation as the particle rolls back and forth between upward slopes

Each of the six types of motion detected by a complete set of accelerometers and gyros disturbs the particle in a distinctive way.

## Media

~~~
<div class="project-images">
    <img src="/assets/thumbnails/inertial-sensing/particle-trap-imu/thumb.jpg" alt="Particle Trap IMU">
    <figure>
        <img src="/assets/images/inertial-sensing/particle-trap-imu/system.jpg" alt="System Overview">
        <figcaption>The Particle Trap IMU system showing the circuit board and trap structure</figcaption>
    </figure>
</div>
~~~

## Applications

* Motion tracking in GPS-denied environments
* Hospital worker location tracking
* Navigation systems
* Orientation sensing
* General motion detection
* Building and mechanical system monitoring

## Related Work

* [Haltere IMU](/projects/inertial-sensing/haltere-imu/)
* [MEMS Accelerometer](/projects/inertial-sensing/mems-accelerometer/)