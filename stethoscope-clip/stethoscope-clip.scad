text_input = "Mohd PH";
text_size = 5;
text_height = 2;
font = "DejaVu Sans Mono";
text_plate_width_modifier = 1;  // [0.1:0.01:2]
text_plate_white_space = 5;
stethoscope_tube_diameter = 8.5;
clipper_length = 20;
clipper_clearance = 0.4;
clipper_wall_thickness = 2;
$fn = 100;


// Hidden
text_base_width = len(text_input) * text_size * text_plate_width_modifier + text_plate_white_space;

// Text
linear_extrude(text_height)
text(text_input, size = text_size, halign = "center", valign = "center", font = font);

// Text base
translate([0, 0, -0.5])
cube([text_base_width, (text_size + text_plate_white_space) * 2, 1], center = true);

// Text base to clipper bridge
scale([1, ((text_size + text_plate_white_space) * 1.41) / sqrt((text_base_width / 2) * (text_base_width / 2) + (text_base_width / 2) * (text_base_width / 2)), 1])
translate([0, 0, -4])
rotate([0, 0, 45])
cylinder(h = 3, r1 = clipper_length * .71, r2 = sqrt((text_base_width / 2) * (text_base_width / 2) + (text_base_width / 2) * (text_base_width / 2)), $fn = 4);


// Clipper
translate([0, 0, -((stethoscope_tube_diameter / 2) + clipper_clearance + clipper_wall_thickness + 2.5)])
difference(){
    // Wall
    translate([clipper_length / -2, 0, 0])
    rotate([0, 90, 0])
    cylinder(h = clipper_length, r = (stethoscope_tube_diameter / 2) + clipper_clearance + clipper_wall_thickness);

    // Stethoscope tube
    translate([clipper_length / -2, 0, 0])
    rotate([0, 90, 0])
    cylinder(h = clipper_length, r = (stethoscope_tube_diameter / 2) + clipper_clearance);


    // Cutoff
    scale([1,1,1.25])
    translate([clipper_length / -2, 0, -stethoscope_tube_diameter + clipper_wall_thickness + clipper_clearance])
    rotate([0, 90, 0])
    cylinder(h = clipper_length, r = (stethoscope_tube_diameter / 2));
}
