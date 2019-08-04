module dome(radius = 1, tickness = 0.1) {
  difference() {
    sphere(radius);
    sphere(radius - tickness / 2);
    translate([0, 0, -radius])
    cube(radius * 2, center = true);
  }
}
