PolyPoints = [
    [0,0,0],
    [4.5,0,0],
    [5.5,3.5,0],
    [-1,3.5,0],
    [-0.275,1,1],
    [4.775,1,1],
    [5.5,3.5,1],
    [-1,3.5,1]
];
PolyFaces = [
    [0,1,2,3],
    [4,5,1,0],
    [7,6,5,4],
    [5,6,2,1],
    [6,7,3,2],
    [7,4,0,3]
];

module prism(l, w, h){
    polyhedron(
        points=[[0,0,0], [l,0,0], [l,w,0], [0,w,0], [0,w,h], [l,w,h]],
        faces=[[0,1,2,3],[5,4,3,2],[0,4,5,1],[0,3,4],[5,2,1]]
    );
}
   
rotate([-90,0,0])
    translate([0,-31,0])
        prism(1, 30, 9);
rotate([-90,0,0])
    translate([24.5,-31,0])
        prism(1, 30, 9);
rotate([-90,0,0])
    translate([44.5,-31,0])
        prism(1, 30, 9);
rotate([-90,0,0])
    translate([64.5,-31,0])
        prism(1, 30, 9);
rotate([-90,0,0])
    translate([84.5,-31,0])
        prism(1, 30, 9);
rotate([-90,0,0])
    translate([104.5,-31,0])
        prism(1, 30, 9);
rotate([-90,0,0])
    translate([124.5,-31,0])
        prism(1, 30, 9);
rotate([-90,0,0])
    translate([142.5,-31,0])
        prism(1, 30, 9);
            
union() {
    difference() {
        cube([143.5,9,1]);
        translate([137,5,0])
        cylinder(1,1.75,1.75);
        translate([116.5,5,0])
        cylinder(1,1.75,1.75);
        translate([96,5,0])
        cylinder(1,1.75,1.75);
        translate([75.5,5,0])
        cylinder(1,1.75,1.75);
        translate([55,5,0])
        cylinder(1,1.75,1.75);
        translate([34.5,5,0])
        cylinder(1,1.75,1.75);
        translate([14,5,0])
        cylinder(1,1.75,1.75);
    }
    rotate([90,0,0])
    difference() {
        union() {
            translate([-5,0,0])
            cube([152,24,1]);
            translate([5,24,0])
            cylinder(1,10,10);
            translate([137,24,0])
            cylinder(1,10,10);
            translate([5,24,0])
            cube([132,10,1]);

//            translate([20,20,1])
//            polyhedron(PolyPoints, PolyFaces);
//            translate([117.5,20,1])
//            polyhedron(PolyPoints, PolyFaces);
            
            translate([20.25,20.25,1])
            cube([4,3,2]);
            translate([20.75,18.25,2])
            cube([3,2,1]);
            translate([117.75,20.25,1])
            cube([4,3,2]);
            translate([118.25,18.25,2])
            cube([3,2,1]);
        }
        translate([75.5,21.5,0])
        cylinder(1,2,2);
    }
}

