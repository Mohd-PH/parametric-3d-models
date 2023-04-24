total_height = 40.9;
base_height = 7.3;
base_bottom_inner_diameter = 14;
base_top_inner_diameter = 11;
tip_top_inner_diameter = 2;
wall_thickness = 0.8;

$fs = .01;

module ear_speculum(total_height = 40.9, base_height = 7.3, base_bottom_inner_diameter = 14, base_top_inner_diameter = 11, tip_top_inner_diameter = 2, wall_thickness = 0.8){
    base_bottom_inner_radius =  base_bottom_inner_diameter / 2;
    base_top_inner_radius =  base_top_inner_diameter / 2; 
    tip_top_inner_radius =  tip_top_inner_diameter / 2;
    union(){
        difference(){
            union(){
                // Base
                cylinder(h= base_height,r1= base_bottom_inner_radius + wall_thickness, r2=base_top_inner_radius + wall_thickness); 
                // Tip
                translate([0, 0, base_height]) 
                cylinder(h= total_height - base_height ,r1= base_top_inner_radius + wall_thickness, r2=tip_top_inner_radius + wall_thickness); 
            }

            // Inner space
            union(){
                // Base inner space
                cylinder(h= base_height,r1= base_bottom_inner_radius, r2=base_top_inner_radius); 
                // Tip inner space
                translate([0, 0, base_height]) 
                cylinder(h= total_height - base_height ,r1= base_top_inner_radius, r2=tip_top_inner_radius ); 
            }
        }

        // Hook
        translate([((base_bottom_inner_radius + base_top_inner_radius)/2) + (wall_thickness/ 2), 0, 1.22])
        rotate([0, 4, -95])
        cube([3.33, 1.0, 0.4], center = true);
    }
}


ear_speculum(
    total_height,
    base_height,
    base_bottom_inner_diameter,
    base_top_inner_diameter,
    tip_top_inner_diameter,
    wall_thickness
);

