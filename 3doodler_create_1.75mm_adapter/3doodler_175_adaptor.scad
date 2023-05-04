$fn=100;

difference() {
    cylinder(h=6.7, d1=7, d2=7, center=false);
    translate([0, 0, -0.1])
        cylinder(h=6.9, d1=3.5, d2=3.5, center=false);
    translate([-5, -1-4.8+(3.5/2), -0.1])
        cube([10, 1.1, 4.2], center=false);
    translate([-5, +5.3-3.5, -0.1])
        cube([10, 10, 10], center=false);
    hull() {
        translate([-3.5/2, 0, -0.1])
            cube([3.5, 3, 10], center=false);
        translate([-7/2, 2.5, -0.1])
            cube([7, 1, 10], center=false);
    }
}
translate([5-2, -3.5+4, 6.7-3.5])
    cube([2, 1, 3.5], center=false);
translate([-5, -3.5+4, 6.7-3.5])
    cube([2, 1, 3.5], center=false);

