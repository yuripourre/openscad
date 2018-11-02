// Model of dupont female connectors. 
// 
// Units are metric

module dupont_female_jumper() {
    dupont_female_connector(1, 1);
}

module dupont_female_connector(rows = 1, cols = 1) {
    cl = 2.54;
    wire = 1;
    h = 14;
    
    width = cl * rows;
    height = cl * cols;
    
    color("gray") {
        difference() {
            cube(size = [width, height, h], center = true);
            for ( col = [0: cols - 1 ] ) {
                for ( row = [0: rows - 1 ] ) {
                    translate([-width/2+wire/2*cl+cl*row,-height/2+wire/2*cl+cl*col,h/2]) cube(size = [wire, wire, h], center=true);
                }
            }
       }
   }
}

