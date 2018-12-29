// Original Code from: https://www.thingiverse.com/thing:38396

// Example
// Creates a led with 5mm
// led();
// Creates a rgb led 5mm
// led(5, wires = 4);
// Creates a rgb led 5mm
// led_rgb();

module led_rgb() {
  led(wires = 4);
}

module led(diameter = 5, wires = 2) {
    // Led
    height = diameter * 1.5;
    // LED Flange Thickness
    flange_thick = 1;
    // LED Flange Diameter
    flange_diameter = diameter * 1.2;
    // Wires
    wire_diameter = .5;
    wire_height = 10;
    wire_distance = diameter / (wires + 1); // The distance between the Wires

    translate([0, 0, flange_thick]) cylinder(height - (diameter / 2) - flange_thick, diameter / 2, diameter / 2, $fn=25);
    translate([0, 0, height - (diameter / 2)]) sphere(diameter / 2,  $fn=25);
    cylinder(flange_thick, flange_diameter / 2, flange_diameter / 2, $fn=25);
    
    for (a =[1:wires]) {
        translate([0, -(diameter / 2) + wire_distance * a, -wire_height]) cylinder(wire_height, wire_diameter / 2, wire_diameter / 2, $fn=25);
    }
}
