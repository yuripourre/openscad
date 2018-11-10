// pin_header.scad
//
// Model of through-hole pin headers. 
// 
// Units are metric
//
// "rows" is the number of rows. Default is 2.
// "cols" is the number of columns. Default is 1.
// "height" is the total length of the pin. Default is 12mm.
// "upper" is the length of the pin above the stopper. Default is 7mm.
//
// Examples:
// round_pin_header( 2, 2, 12, 5 );
// round_pin_header( rows=5, cols=1 );
// Based on Paul McGovern's pin header
// https://www.thingiverse.com/thing:26474

module round_pin_header_long( rows=2, cols=1 ) {
    round_pin_header(rows, cols, height = 14, upper = 9);
}

module round_pin_header( rows=2, cols=1, height=12, upper=5 ) {
    pin_radius = 0.30;
    pin_radius_base = 0.75;
    cl = 2.54;

    translate( [ -(rows  * cl/2 ) + cl /2, -(cols  * cl/2 ) + cl /2, 0 ] ) {

        for( col = [0: cols -1 ] ) {
            for( row = [0 : rows -1 ] ) {
                translate( [ cl * row , cl * col, 0] ) {
                    color( "gray" )
                        translate( [0,0, cl / 2]) {
                            intersection() {
                                cube( [ cl, cl, cl ], center=true );
                                rotate( [0, 0, 45] ) cube( [ 2.8, 2.8, cl ], center=true );
                            }
                        }

                    color( "silver" ) {
                        translate( [0, 0, -0.4] )
                        // Bases
                        cylinder(r1 = pin_radius, r2 = pin_radius_base, h=0.8, center = true);
                        translate( [0, 0, cl + 0.4] )
                        cylinder(r2 = pin_radius, r1 = pin_radius_base,, h = 0.8, center = true);
                        // Wire
                        translate( [0,0, (upper - ( height / 2 )) + cl ] ) {
                            cylinder(d=pin_radius, h=height, center = true);
                        }
                    }
                }
            }
        }
    }
}
