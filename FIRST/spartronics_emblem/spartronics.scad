/*
 * The Spartronics Emblem
 */
$fn=100;

module helmet(center=false) {
    import("images/spartronics-helmet.svg", center=center, dpi=96);
}

module rounded_rectangle(length) {
    rounding = 2.5;
    minkowski() {
        offset(r=-rounding)
            intersection() {
                square([0.25*length, length], center=true);
                circle(d=length);
            }
        circle(r=rounding);
    }
}

module base_outline(diameter) {
    difference() {
        union() {
            for (i=[0:3]) {
                rotate([0, 0, i * 45])
                    rounded_rectangle(diameter);
            }
            circle(d=0.87*diameter);
        }
        circle(d=0.77*diameter);
    }

}

module curved_text(line, radius, spacing, reverse=false, center=true) {
    angle_step = (180 * spacing) / (radius * PI) * (reverse ? -1 : 1);
    rotate([0, 0, angle_step * (len(line) - 1) / 2 - 90]) {
    union() {
        for (i=[0:len(line) - 1]) {
            point = [-radius * cos(angle_step * i), radius * sin(angle_step * i), 0];
            translate(point)
                rotate(-i*angle_step+(reverse ? -90 : 90))
                text(line[i], halign="center", valign="center", size=8, font="SF TransRobotics");
        }
    }
    }
}

height=10;
base_height=5;
recess_factor=0.5;
outer_diameter=75;
text_fraction=0.32;

helmet_thickness=0.7;

color("yellow")
translate([-3,1,base_height])
linear_extrude(height=recess_factor*(height-base_height))
scale(0.40)
helmet(center=true);

color("yellow")
linear_extrude(height=height)
base_outline(outer_diameter);

color("blue")
linear_extrude(height=base_height)
circle(d=0.77*outer_diameter);

color("yellow")
translate([0,0,base_height])
linear_extrude(height=recess_factor*(height-base_height))
curved_text("SPARTRONICS", text_fraction*outer_diameter, 6.5);

color("yellow")
rotate([0,0,180])
translate([0,0,base_height])
linear_extrude(height=recess_factor*(height-base_height))
curved_text("4915", text_fraction*outer_diameter, 6.5, reverse=true);
