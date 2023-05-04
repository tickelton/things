$fn=100;

base_length = 6.5;
total_width = 9.8;
tab_length = 3.35;
tab_thickness = 1.3;
outer_diameter = 7;
inner_diameter = 2.25;

difference() {
    cylinder(h=base_length, d1=outer_diameter, d2=outer_diameter, center=false);
    translate([0, 2.25/2, -0.1])
        cylinder(h=6.9, d1=inner_diameter, d2=inner_diameter, center=false);
    translate([-5, -1-4.8+(3.5/2), -0.1])
        cube([10, 1.1, 4.2], center=false);
    translate([-5, +5.3-3.5, -0.1])
        cube([10, 10, 10], center=false);
    hull() {
        translate([-inner_diameter/2, inner_diameter/2, -0.1])
            cube([inner_diameter, 3, 10], center=false);
        translate([-7/2, 2, -0.1])
            cube([7, 2, 10], center=false);
    }
}
translate([(total_width/2)-2, (-outer_diameter/2)+3, base_length-tab_length])
    cube([2, tab_thickness, tab_length], center=false);
translate([-(total_width/2), (-outer_diameter/2)+3, base_length-tab_length])
    cube([2, tab_thickness, tab_length], center=false);

