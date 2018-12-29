# Patch Module

This module overrides rotate_extrude in versions < 2015 where angle does not work

## Examples
```
// Rotates extrude a circle with angle
circular_extrude(angle=90)
translate([20,0]) circle(10);
```
