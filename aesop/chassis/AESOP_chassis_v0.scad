include <MCAD/lego_compatibility.scad>

Base_Height = 3;
Base_Width = 75;
Base_Length = 155;
Powerbank_Front_Support_Width = 10;
Powerbank_Front_Support_Height = 53;
Powerbank_Front_Support_Length = 15;
Powerbank_Rear_Support_Width = 15;
Powerbank_Rear_Support_Height = Powerbank_Front_Support_Height;
Powerbank_Rear_Support_Length = 10;
Servo_Mounts_Width = 2.5;
Servo_Mounts_Height = 12;
Servo_Mounts_Length = 5;
Servo_Mounts_Hole_radius = 1.25;
Servo_Mounts_distance = 22.5;
RPi_Mounts_Width = 7;
RPi_Mounts_Heigth = RPi_Mounts_Width;
RPi_Mounts_Length = RPi_Mounts_Width;
$fn = 100;

module Powerbank_front_support_raw() {
    difference() {
        cube([Powerbank_Front_Support_Length, Powerbank_Front_Support_Width, Powerbank_Front_Support_Height]);
        translate([0, 10, 40]) cylinder(14, 10, 10);
    }
}

module Powerbank_front_support(side) {
    if(side == 0) {
        Powerbank_front_support_raw();
    } else if(side == 1) {
        mirror([0, 1, 0]) Powerbank_front_support_raw();
    }
}

module Powerbank_rear_support() {
    difference() {
        cube([10, 15, Powerbank_Rear_Support_Height]);
        translate([48, 7.5, 40]) cylinder(14, 44, 44);
    }
}

module Servo_mounts_single() {
    difference() {
    cube([Servo_Mounts_Length, Servo_Mounts_Width, Servo_Mounts_Height]);
    translate([Servo_Mounts_Length/2, Servo_Mounts_Width+0.1, Servo_Mounts_Height/2])
        rotate([90, 0, 0])
            cylinder(Servo_Mounts_Width+0.2, Servo_Mounts_Hole_radius, Servo_Mounts_Hole_radius);
    }
}

module Servo_mounts() {
    Servo_mounts_single();
    translate([Servo_Mounts_Length+Servo_Mounts_distance, 0, 0])
        Servo_mounts_single();
}

module Lego_mounts() {
    translate([Base_Length-(5*knob_spacing+knob_diameter+wall_thickness*2), 0, Base_Height])
        block(4,6,0);
    translate([Base_Length-(5*knob_spacing+knob_diameter+wall_thickness*2), Base_Width-(3*knob_spacing+knob_diameter+wall_thickness*2), Base_Height])
        block(4,6,0);
}

module RPi_mount() {
    difference() {
        cube([RPi_Mounts_Width, RPi_Mounts_Length, RPi_Mounts_Heigth]);
        translate([2, 4.5, 4])
            cube([5, 2.6, 3.1]);
        translate([4.5, 2, 4])
            cube([2.6, 5, 3.1]);
        translate([RPi_Mounts_Width-2.5, RPi_Mounts_Length-2.5, 4])
            cylinder(3.1, 2.5, 2.5);
    }
}

module RPi_mounts() {
    translate([37, 3, Base_Height])
        RPi_mount();
    translate([37, Base_Width-3, Base_Height])
        mirror([0, 1, 0])
            RPi_mount();
    translate([37+14+22, 3, Base_Height])
        mirror([1, 0, 0])
            RPi_mount();
    translate([37+14+22, Base_Width-3, Base_Height])
        mirror([1, 1, 0])
            RPi_mount();
}

difference() {
    // base plate
    cube([Base_Length, Base_Width, Base_Height+0.1]);
    // holes
    hole_radius = 7;
    hole_distance = 2;
    for(i = [0 : 2])
        for(j = [0:5])
            translate([20+j*2*hole_radius+j*hole_distance, 22+i*2*hole_radius+i*hole_distance, -0.1])
                cylinder(Base_Height+0.3, hole_radius, hole_radius);
}

// front bowerbank supports
translate([Base_Length-Powerbank_Front_Support_Length, 0, Base_Height])
    Powerbank_front_support(0);
translate([Base_Length-Powerbank_Front_Support_Length, Base_Width, Base_Height])
    Powerbank_front_support(1);

// rear powerbank support
translate([0, (Base_Width/2)-(Powerbank_Rear_Support_Width/2), Base_Height])
    Powerbank_rear_support();

// servo mounts
translate([0, 0, Base_Height])
    Servo_mounts();
translate([0, Base_Width-Servo_Mounts_Width, Base_Height])
    Servo_mounts();

Lego_mounts();

// Raspberry Pi Zero mounts
RPi_mounts();




