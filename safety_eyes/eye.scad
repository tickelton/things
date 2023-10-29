$fn=64;

eye_diameter = 3.5;
stem_length = 4;
stem_diameter = 1.2;
lock_diameter = stem_diameter + 0.8;
lock_offset = 2.5;

cube_size = eye_diameter + 1;

difference() {
    sphere(d = eye_diameter);
    translate([-(cube_size/2), -(cube_size/2), 0])
        cube([cube_size, cube_size, cube_size]);
}
translate([0, 0, -0.1])
    cylinder(h = stem_length + 0.1, d = stem_diameter);
translate([0, 0, stem_length])
    sphere(d = stem_diameter);
translate([0, 0, lock_offset])
    sphere(d = lock_diameter);
