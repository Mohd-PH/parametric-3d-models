// Add some tolerance if needed
width = 127; // 5 inch in millimeter
// Add some tolerance if needed
length = 76.2; // 3 inch in millimeter
height = 22;
wall_thickness = 1;
floor_thickness = 2;

$fn = 100;

module notes_display_and_holder(){
    union(){
        // Papers holder
        difference(){
            union(){
                cube([width + wall_thickness, length + wall_thickness + wall_thickness, height], center = true);
                translate([0, 0, -height/2])
                cube([width + wall_thickness, length + wall_thickness + wall_thickness, floor_thickness], center = true);
            }
            translate([0, 0, wall_thickness])
            cube([width, length, height], center = true);

            // Right cutout
            translate([width / 2, 0, (height / 2) + wall_thickness])
            scale([1, length / height / 2, 1])
            sphere(r = height);
            // Left cutout
            translate([width / -2, 0,(height / 2) + wall_thickness])
            scale([1, length / height / 2, 1])
            sphere(r = height);
        }

        // Paper clip
        translate([0, (length/ 2) + wall_thickness, (-(height + floor_thickness) / 2) + 0.5])
        union(){
            // base
            translate([0, 5.5, 0])
            cube([10, 11, 1], center = true);
            // back
            translate([0, 5, 4.5])
            rotate([20, 0, 0])
            cube([10, 1, 10], center = true);
            // front
            translate([0, 10, 2])
            rotate([20, 0, 0])
            cube([10, 1, 4], center = true);
            intersection(){
                translate([0, 5.5, 0])
                cube([10, 110, 1], center = true);
                translate([0, 5, 4.5])
                rotate([20, 0, 0])
                cube([10, 1, 200], center = true);
            }
            intersection(){
                translate([0, 5.5, 0])
                cube([10, 110, 1], center = true);
                translate([0, 10, 2])
                rotate([20, 0, 0])
                cube([10, 1, 40], center = true);
            }
        }
    }
}



notes_display_and_holder();
