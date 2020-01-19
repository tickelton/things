$fn = 100;

module pin() {
    hull() {
        translate([0, 0, -6.9])
            sphere(1);
        translate([0, 0, -5.9])
            cylinder(6, 1.8, 1.8);
    }
}

module slot()  {
    difference () {
        cylinder(20.1, 4.25, 4.25);
        translate([0, 0, -0.1])
            cylinder(20.3, 2.25, 2.25);
    }
}


module connectors() {
    pin();
    translate([0, 0, 1.4])
        slot();
}

hull() {
    translate([4.5, 4.5, 0])
        cylinder(1.5, 4.5, 4.5);
    translate([4.5, 122-4.5, 0])
        cylinder(1.5, 4.5, 4.5);
    translate([26, 3, 0])
        cylinder(1.5, 3, 3);
    translate([32, 122-3, 0])
        cylinder(1.5, 3, 3);
    translate([159, 58, 0])
        cylinder(1.5, 10, 10);
    translate([159, 66, 0])
        cylinder(1.5, 10, 10);
}

translate([9, 8, 0])
    connectors();
translate([9, 117.75, 0])
    connectors();
translate([62, 18, 0])
    connectors();
translate([89, 96.5, 0])
    connectors();
translate([145, 76.5, 0])
    connectors();

