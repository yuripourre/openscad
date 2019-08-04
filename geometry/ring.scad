module ring(radius = 1, length = 0.1, height = 0.1) {
  difference() {
    cylinder(height, radius + length, radius + length);
    translate([0, 0, -height])
    cylinder(height * 2, radius, radius);
  }
}
