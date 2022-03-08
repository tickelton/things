$fn = 64;

for (i = [2:10]) {
    translate([(i-2)*20, 0, 0])
        difference() {
            cylinder(10, i/2, i/2);
            translate([0, 0, -1])
                cylinder(12, i/4, i/4);
        }
}

for (i = [11:19]) {
    translate([(i-11)*20, 20, 0])
        difference() {
            cylinder(10, i/2, i/2);
            translate([0, 0, -1])
                cylinder(12, i/4, i/4);
        }
}

for (i = [2:10]) {
    translate([(i-2)*20, 40, 0])
        difference() {
            cube([i, i, 10]);
            translate([i/4, i/4, -1])
                cube([i/2, i/2, 12]);
        }
}

for (i = [11:19]) {
    translate([(i-11)*20, 60, 0])
        difference() {
            cube([i, i, 10]);
            translate([i/4, i/4, -1])
                cube([i/2, i/2, 12]);
        }
}
