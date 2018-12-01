// WS2812 (Neopixel) Led modules (in mm)

module ws2812b() {
  cube([4.5, 4.5, 1], center = true);
}

// Link: https://www.adafruit.com/product/1612
module neopixel_mini_pcb() {
  cylinder(h = 1, d = 10, center = true);
  translate([0, 0, 1])
  ws2812b();
}