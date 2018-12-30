# Circular Snapfit Module

Based on ideas from: https://www.youtube.com/watch?v=iF_P5ie_b8o

## Dependencies
This module depends on circular_extrude (patch)

If you are using a newer version of openscad you can replace circular_extrude with rotate_extrude.

## Examples
```
// Simple trail
circular_snapfit(diameter = 15, angle = 60);
```
```
// Inner (Dual) Trail
circular_snapfit_dual(diameter = 15, angle = 60);
```

```
// Cap (Dual) Trail
circular_snapfit_dual_cap(diameter = 15, angle = 60);
```
