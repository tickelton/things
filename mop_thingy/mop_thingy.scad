$fn = 64;

peg_height = 10;
hole_radius = 4;

difference() {
    union() {
        cube([15, 5, peg_height]);
        
        translate([-(18-15)/2, 0, 9.9])
            cube([18, 7, (17/2)+0.1]);
        
        translate([15/2, 7, 15-(17/2)+peg_height])
            rotate([90, 0, 0])
                difference() {
                    cylinder(7, 17/2, 17/2);
                    translate([-10, -10.1, -0.1])
                        cube([20, 10, 10]);
                }
    }
    
    translate([15/2, 5, 15-(17/2)+10])
        rotate([90, 0, 0])
            cylinder(10, hole_radius, hole_radius);
}

