$fn=100;

difference() {
    hull() {
        union() {
            cube([53, 53, 50]);
            translate([30, 0, 47])
                cube([60, 80, 3]);
        }
    }
    translate([-1, -1, -0.5])
        cube([51, 51, 54]);

    translate([55, 15, 15])
        rotate([0, 90, 0])
            cylinder(h=50, d1=7.5, d2=7.5);
    translate([55, 35, 35])
        rotate([0, 90, 0])
            cylinder(h=50, d1=7.5, d2=7.5);
    translate([55, 15, 35])
        rotate([0, 90, 0])
            cylinder(h=50, d1=7.5, d2=7.5);
    translate([55, 35, 15])
        rotate([0, 90, 0])
            cylinder(h=50, d1=7.5, d2=7.5);
    translate([49, 15, 15])
        rotate([0, 90, 0])
            cylinder(h=50, d1=4.5, d2=4.5);
    translate([49, 35, 35])
        rotate([0, 90, 0])
            cylinder(h=50, d1=4.5, d2=4.5);
    translate([49, 15, 35])
        rotate([0, 90, 0])
            cylinder(h=50, d1=4.5, d2=4.5);
    translate([49, 35, 15])
        rotate([0, 90, 0])
            cylinder(h=50, d1=4.5, d2=4.5);
    translate([53, 15, 15])
        rotate([0, 90, 0])
            cylinder(h=2, d1=4.5, d2=7.5);
    translate([53, 35, 35])
        rotate([0, 90, 0])
            cylinder(h=2, d1=4.5, d2=7.5);
    translate([53, 15, 35])
        rotate([0, 90, 0])
            cylinder(h=2, d1=4.5, d2=7.5);
    translate([53, 35, 15])
        rotate([0, 90, 0])
            cylinder(h=2, d1=4.5, d2=7.5);

    translate([15, 50+55, 35])
        rotate([90, 0, 0])
            cylinder(h=50, d1=7.5, d2=7.5);
    translate([35, 50+55, 15])
        rotate([90, 0, 0])
            cylinder(h=50, d1=7.5, d2=7.5);
    translate([15, 50+55, 15])
        rotate([90, 0, 0])
            cylinder(h=50, d1=7.5, d2=7.5);
    translate([35, 50+55, 35])
        rotate([90, 0, 0])
            cylinder(h=50, d1=7.5, d2=7.5);
    translate([15, 50+49, 35])
        rotate([90, 0, 0])
            cylinder(h=50, d1=4.5, d2=4.5);
    translate([35, 50+49, 15])
        rotate([90, 0, 0])
            cylinder(h=50, d1=4.5, d2=4.5);
    translate([15, 50+49, 15])
        rotate([90, 0, 0])
            cylinder(h=50, d1=4.5, d2=4.5);
    translate([35, 50+49, 35])
        rotate([90, 0, 0])
            cylinder(h=50, d1=4.5, d2=4.5);
    translate([15, 50+53, 35])
        rotate([90, 0, 0])
            cylinder(h=2, d1=4.5, d2=7.5);
    translate([35, 50+53, 15])
        rotate([90, 0, 0])
            cylinder(h=2, d1=4.5, d2=7.5);
    translate([15, 50+53, 15])
        rotate([90, 0, 0])
            cylinder(h=2, d1=4.5, d2=7.5);
    translate([35, 50+53, 35])
        rotate([90, 0, 0])
            cylinder(h=2, d1=4.5, d2=7.5);

}
