include <../patch/circular_extrude.scad>;  
 
module circular_snapfit_trail(h = 2, width = 0.8, wall = 0) {
  hh = h / 2;
  if(wall<=0) {
    polygon(points=[[0,hh],[0,-hh],[-width,0]]);
  } else {
      polygon(points=[[wall, hh], [0,hh],[-width,0], [0,-hh],[wall, -hh]]);
  }
}
 
// Values from: https://www.youtube.com/watch?v=iF_P5ie_b8o
// Someone commented that width = 1 is too tight, so 0.8 might be good
module circular_snapfit(diameter = 10, angle = 30, width = 0.8, height = 2, wall = 0) {
  rotate([0, 0, -angle/2])
  circular_extrude(angle, convexity = 100)
  translate([diameter / 2, 0, 0])
  circular_snapfit_trail(wall = wall);
}

module circular_snapfit_dual(diameter = 10, angle = 30, width = 0.8, height = 2, displacement = 0, wall = 0) {
    translate([displacement, 0,0])
    circular_snapfit(diameter, angle, wall = wall);
    translate([-displacement, 0,0])
    rotate([0, 0, 180])
    circular_snapfit(diameter, angle, wall = wall);
}

module circular_snapfit_dual_cap(diameter = 10, angle = 30, angle_offset = 8, width = 0.8, height = 2) {
    cut_offset = 0.1;
    difference() {
      cylinder(h=height, d = diameter, center = true);
      circular_snapfit(diameter = diameter, angle = angle+angle_offset, width=width, wall = cut_offset);
      rotate([0, 0, 180])
      circular_snapfit(diameter = diameter, angle = angle+angle_offset, width=width, wall = cut_offset);
    }
}