$fn = 100;

module box_top() {
    translate([25.581, 23.235, 0])
        rotate(a=[0,0,-52.5])
            square([4, 7], center=false);
}

module box_bottom() {
    translate([19.702, 1.453, 0])
        square([4, 7.1], center=false);
}

module box_bottom_long() {
    translate([19.702, 1.453, 0])
        square([4, 15], center=false);
}

module circle_bottom() {
    translate([28.8, 8.939, 0])
        circle(r=9);
}

module circle_middle() {
    translate([14, 20.655, 0])
        circle(r=14);
}

module circle_top() {
    translate([37.944, 15.252, 0])
        circle(r=14);
}

module Kuechenhaken(width) {
    translate([-19.702, -1.453, 0])
        linear_extrude(height = width)
            union() {
                intersection() {
                    box_top();
                    circle_top();
                }
                intersection() {
                    circle_top();
                    circle_middle();
                }
                intersection() {
                    circle_middle();
                    circle_bottom();
                }
                intersection() {
                    circle_bottom();
                    box_bottom_long();
                }
                box_bottom();
            }
}

Kuechenhaken(10);
linear_extrude(height = 5)
    union() {
    translate([0, -50, 0])
        square([4, 50], center=false);
    translate([15, -50, 0])
        difference() {
        circle(d=30);
        circle(d=22);
        translate([-20, 0, 0])
            square([40, 20], center=false);
        }
    }
    
/*    
//scale([1.2, 1, 1])
Kuechenhaken(10);
linear_extrude(height = 5)
    union() {
    translate([0, -40, 0])
        square([4, 40], center=false);
    translate([10, -40, 0])
        difference() {
        circle(d=20);
        circle(d=12);
        translate([-20, 0, 0])
            square([40, 20], center=false);
        }
    }
*/