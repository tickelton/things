$fn=64;

difference() {
    union() {
        cylinder(23.5, 3.5, 3.5);
            translate([0, 0, 23.5])
        sphere(3.5);
    }

    translate([0, 5, 14])
        rotate([90, 0, 0])
            cylinder(10, 1.25, 1.25);
    
    translate([0, 0, -1])
        cylinder(9, 1.5, 1.5);
    
}