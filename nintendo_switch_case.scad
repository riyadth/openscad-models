include <nintendo_switch_constants.scad>;
use <nintendo_switch_card.scad>;

$fn=50;
y_separation = 5;
x_separation = 10;

hollow_height = height+2.5;
hollow_width = width+2.5;
hollow_depth = depth+1.0;

extrude_depth = 5;

r=3.0;

x_num=1;
y_num=3;

outer_spacing=5;
outer_height=2*outer_spacing + x_num * (height+x_separation);
outer_width=2*outer_spacing + y_num * (width+y_separation);

color("red") {
    difference() {
        linear_extrude(extrude_depth) {
            hull() {
                translate([r,r,0]) circle(r);
                translate([outer_height-r,r,0]) circle(r);
                translate([outer_height-r,outer_width-r,0]) circle(r);
                translate([r,outer_width-r,0]) circle(r);
            }
        }

        for (x=[0:x_num-1]) {
            for (y=[0:y_num-1]) {
                factor = 0.1;
                x_pos=outer_spacing + x_separation/2 + x*(height + x_separation) - height * factor/2;
                y_pos=outer_spacing + y_separation/2 + y*(width + y_separation) - width * factor/2;
                translate([x_pos, y_pos, 1.5]) scale([1 + factor, 1 + factor, 2])
                        base_form();

                new_x_pos=outer_spacing + x_separation/2 + x*(height + x_separation) - height*factor/2;
                new_y_pos=outer_spacing + y_separation/2 + width/2.0 + y*(width + y_separation);
                translate([new_x_pos,new_y_pos, 1.5]) cylinder(20, hollow_depth);
            }
        }


    }
}

for (x=[0:x_num-1]) {
    for (y=[0:y_num-1]) {
        x_pos=outer_spacing + x_separation/2 + x*(height + x_separation);
        y_pos=outer_spacing + y_separation/2 + y*(width + y_separation);
        translate([x_pos, y_pos, 1.6])
            cartridge("Blah", "blah");
    }
}
