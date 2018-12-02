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
// pin_header( 2, 1, 12, 7 );
// pin_header( rows=5, cols=1 );
// By Paul McGovern
// https://www.thingiverse.com/thing:26474

module pin_header_long( rows=2, cols=1 ) {
    pin_header(rows, cols, height = 14, upper = 9);
}

module pin_header( rows=2, cols=1, height=12, upper=7 ) {
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
                    translate( [0,0, (upper - ( height / 2 )) + cl ] ) {
                        union() {
                            cube( [0.64,0.64,height], center=true );
                            translate( [0,0, height/2 ] ) scale( 0.64 ) _pin_point();
                            translate( [0,0, -height/2 ] ) scale( 0.64 ) rotate([180,0,0]) _pin_point();
                        }
                    }
                }
            }
        }
    }
}
}

module _pin_point() {
    translate( [-0.5,-0.5, 0])
        polyhedron( 
            points=[[0,0,0],[0,1,0],[1,1,0],[1,0,0],[0.5,0.5,0.5]], 
            faces=[[0,1,2],[0,2,3],[0,1,4],[1,2,4],[2,3,4],[3,0,4]]);
}
