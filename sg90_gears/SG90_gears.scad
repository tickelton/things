// attempt 2
//gear_radius = 2.35;
//tooth_radius = 0.5;
//tooth_overhang = 0.05;
// attempt 2
//gear_radius = 2.35;
//tooth_radius = 0.5;
//tooth_overhang = 0.1;
// attempt 3
//gear_radius = 2.3;
//tooth_radius = 0.4;
//tooth_overhang = 0.125;
// attempt 4
gear_radius = 2.2;
tooth_radius = 0.25;
tooth_overhang = 0.2;

gear_thickness = 7;
gear_diameter = gear_radius * 2;
gear_circumference = gear_diameter * PI;
tooth_diameter = 2 * tooth_radius;
num_teeth = 21;

$fn = 100;

module sg90gear() {
    cylinder(gear_thickness, gear_radius, gear_radius);

    for (a =[0:num_teeth-1]) {
        rotate([0, 0, (360/num_teeth)*a])
            translate([gear_radius - tooth_radius + tooth_overhang, 0, 0])
                cylinder(gear_thickness, tooth_radius, tooth_radius);
    }
}

sg90gear();

//difference() {
//    cylinder(5, 5, 5);
//    translate([0, 0, -1])
//        sg90gear();
//}