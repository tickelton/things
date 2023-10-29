$fn=64;

render_variant = 0; // 0: projection, 1: 3d model, 2: animation
inner_length = 200;
inner_width = 65;
inner_height = 55;
wall_thickness = 0.65;
top_flap_radius = 10;
inner_sides_height = 20;

bend_allowance = wall_thickness * 0.5;

bottom_wall_flap_height = inner_height - ( wall_thickness * 1.5);
bottom_wall_flap_width = inner_width * 0.4;

module bottom_wall_flap() {
    cube([
        inner_width * 0.4,
        bottom_wall_flap_height + bend_allowance,
        wall_thickness
    ]);
}

module top_flap() {
    hull() {
        translate([-(inner_height * 0.9)+top_flap_radius, top_flap_radius+5, 0])
            cylinder(h = wall_thickness, r1 = top_flap_radius, r2 = top_flap_radius, center = true);
        translate([-(inner_height * 0.9)+top_flap_radius, inner_width-top_flap_radius-5, 0])
            cylinder(h = wall_thickness, r1 = top_flap_radius, r2 = top_flap_radius, center = true);
        translate([-0.1, 0, 0])
            cube([0.1, inner_width, wall_thickness]);
    }
}

module outer_sides() {
    cube([
        inner_height + ( bend_allowance * 2 ),
        inner_width,
        wall_thickness
    ]);
}

module inner_sides() {
    cube([
        inner_sides_height+ bend_allowance,
        inner_width - (bend_allowance * 2),
        wall_thickness
    ]);

}

module front(tick = 0) {
    cube([
        inner_length + ( bend_allowance * 2 ),
        inner_height + bend_allowance,
        wall_thickness
    ]);
    /*
    rotate(a = 90, v = [0, 1, 0])
        front_bottom_flap_left();
    rotate(a = 90, v = [0, 1, 0])
        front_bottom_flap_right();
    */
}

module rear(tick = 0) {
    cube([
        inner_length + ( bend_allowance * 2 ),
        inner_height + ( bend_allowance * 2 ),
        wall_thickness
    ]);
}

module top_and_bottom() {
    cube([
        inner_length + ( bend_allowance * 2 ),
        inner_width + ( bend_allowance * 2 ),
        wall_thickness
    ]);
}

module full_box() {
    top_and_bottom();
    translate([0, -(inner_height+bend_allowance), 0]) 
        front();
    translate([
        -(inner_width * 0.4),
        -(inner_height + bend_allowance),
         0]) 
        bottom_wall_flap();
    translate([
        inner_length + ( bend_allowance * 2 ),
        -(inner_height + bend_allowance),
         0]) 
        bottom_wall_flap();
    translate([0, inner_width + (2 * bend_allowance), 0]) 
        rear();
    translate([
        -(inner_width * 0.4),
        inner_width + (3 * bend_allowance),
         0]) 
        bottom_wall_flap();
    translate([
        inner_length + ( bend_allowance * 2 ),
        inner_width + (3 * bend_allowance),
         0]) 
        bottom_wall_flap();
    translate([0, inner_width + inner_height +  (4 * bend_allowance), 0]) 
        top_and_bottom();
/*
    translate([0, (2 * inner_width) + inner_height +  (6 * bend_allowance), 0]) 
        front();
*/
    translate([0, inner_width + inner_height +  (5 * bend_allowance), 0])
        top_flap();
    translate([inner_length + ( bend_allowance * 2 ), inner_width + inner_height +  (5 * bend_allowance), 0])
        mirror(v = [1, 0, 0])
            top_flap();
    translate([-(inner_height + ( bend_allowance * 2 )), 0, 0])
        outer_sides();
    translate([inner_length + ( bend_allowance * 2 ), 0, 0])
        outer_sides();
    translate([-(inner_height + ( bend_allowance * 2 ) + inner_sides_height), bend_allowance, 0])
        inner_sides();
    translate([inner_length + ( bend_allowance * 2 ) + inner_height + ( bend_allowance * 2 ), bend_allowance, 0])
        inner_sides();
 }

module fold_box(tick = 0) {
    
    translate([tick, 0, 0]) front();
}

if (render_variant == 0 ) {

    projection(cut = true)
        full_box();
}
else if (render_variant == 1) {
    front();
}
else if (render_variant == 2) {
    //front($t);
}
else {
    echo("ERROR: invalid render_variant!");
}


/*
module front_bottom_flap_left() {
    translate([
        -bottom_wall_flap_width,
        0,
        0,
    ]) bottom_wall_flap();
}

module front_bottom_flap_right() {
    translate([
        inner_length + bottom_wall_flap_width,
        0,
        0,
    ]) mirror([1, 0, 0])
        bottom_wall_flap();
}
*/

