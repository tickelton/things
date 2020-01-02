Dimensions = [
    60,     // Width
    30,     // Depth
    35      // Height
];
Radius = 5; // Radius of corners, if you want them rounded
            // Otherwise use 0.
Hole_Diameter = 8;  // Diameter of holes for rods
Hole_Depth = 15;    // Depth of holes for rods
Hole_Distance_Bottom = 20;  // Distance of holes from bottom
Hole_Distance = 24; // Distance between the holes


module rounded_cube(size, radius) {
    union(){
        translate([radius, radius, radius]) {
            cube(
                [
                    size[0]-2*radius,
                    size[1]-2*radius,
                    size[2]-2*radius
                ]
            );
        }
        // corner spheres
        translate([radius, radius, radius]) {
            sphere(radius);
        }
        translate([size[0]-radius, radius, radius]) {
            sphere(radius);
        }
        translate([radius, size[1]-radius, radius]) {
            sphere(radius);
        }
        translate([radius, radius, size[2]-radius]) {
            sphere(radius);
        }
        translate([size[0]-radius, size[1]-radius, radius]) {
            sphere(radius);
        }
        translate([radius, size[1]-radius, size[2]-radius]) {
            sphere(radius);
        }
        translate([size[0]-radius, radius, size[2]-radius]) {
            sphere(radius);
        }
        translate([size[0]-radius, size[1]-radius, size[2]-radius]) {
            sphere(radius);
        }
        // faces
        translate([radius, radius, 0]) {
            cube([size[0]-2*radius,size[1]-2*radius,radius]);
        }
        translate([radius, radius, size[2]-radius]) {
            cube([size[0]-2*radius,size[1]-2*radius,radius]);
        }
        translate([radius, 0, radius]) {
            cube([size[0]-2*radius,radius,size[2]-2*radius]);
        }
        translate([radius, size[1]-radius, radius]) {
            cube([size[0]-2*radius,radius,size[2]-2*radius]);
        }
        translate([0, radius, radius]) {
            cube([radius,size[1]-2*radius,size[2]-2*radius]);
        }
        translate([size[0]-radius, radius, radius]) {
            cube([radius,size[1]-2*radius,size[2]-2*radius]);
        }
        // edge cylinders (z-axis)
        translate([radius, radius, radius]) {
            cylinder(size[2]-2*radius, radius, radius);
        }
        translate([size[0]-radius, radius, radius]) {
            cylinder(size[2]-2*radius, radius, radius);
        }
        translate([radius, size[1]-radius, radius]) {
            cylinder(size[2]-2*radius, radius, radius);
        }
        translate([size[0]-radius, size[1]-radius, radius]) {
            cylinder(size[2]-2*radius, radius, radius);
        }
        // edge cylinders (x-axis)
        rotate(a = [0,90,0]) {
            translate([-radius, radius, radius]) {
                cylinder(size[0]-2*radius, radius, radius);
            }
        }
        rotate(a = [0,90,0]) {
            translate([-size[2]+radius, radius, radius]) {
                cylinder(size[0]-2*radius, radius, radius);
            }
        }
        rotate(a = [0,90,0]) {
            translate([-size[2]+radius, size[1]-radius, radius]) {
                cylinder(size[0]-2*radius, radius, radius);
            }
        }
        rotate(a = [0,90,0]) {
            translate([-radius, size[1]-radius, radius]) {
                cylinder(size[0]-2*radius, radius, radius);
            }
        }
        // edge cylinders (y-axis)
        rotate(a = [270,00,0]) {
            translate([radius, -radius, radius]) {
                cylinder(size[1]-2*radius, radius, radius);
            }
        }
        rotate(a = [270,00,0]) {
            translate([size[0]-radius, -radius, radius]) {
                cylinder(size[1]-2*radius, radius, radius);
            }
        }
        rotate(a = [270,00,0]) {
            translate([radius, -size[2]+radius, radius]) {
                cylinder(size[1]-2*radius, radius, radius);
            }
        }
        rotate(a = [270,00,0]) {
            translate([size[0]-radius, -size[2]+radius, radius]) {
                cylinder(size[1]-2*radius, radius, radius);
            }
        }
    }
}

holes_space = 2*Hole_Diameter + Hole_Distance;
offset_hole_1 = (Dimensions[0] - holes_space)/2 + Hole_Diameter/2;
offset_hole_2 = offset_hole_1 + Hole_Distance + Hole_Diameter;

difference(){
    rounded_cube(Dimensions, Radius);
    rotate(a = [90,0,0]) {
        translate(
            [
                offset_hole_1,
                Hole_Distance_Bottom,
                -Hole_Depth
            ]
        ) {
            cylinder(Hole_Depth, Hole_Diameter/2, Hole_Diameter/2);
        }
        translate(
            [
                offset_hole_2,
                Hole_Distance_Bottom,
                -Hole_Depth
            ]
        ) {
            cylinder(Hole_Depth, Hole_Diameter/2, Hole_Diameter/2);
        }
    }
}

