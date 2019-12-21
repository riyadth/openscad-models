// Nintendo Switch Game Cartridge

// Units: mm
height = 31.0;
width = 21.0;
depth = 3.0;
radius=1.0;
// For getting offsets right
epsilon=0.1;
my_text = "The Legend of Fejka";
$fn=50;

module form() {
    minkowski() {
        cube(size=[height, width, depth],
                center=false);
        cylinder(r=radius,
                h=0.00001,
                center=false);
    }
}

module cartridge(line1, line2) {
    difference() {
        form();
        translate([0.05 * height, 0.05 * width, 0.9*depth]) {
            scale(v=[0.8, 0.9, 1]) {
                form();
            }
        }

        translate([-1 * radius - epsilon, -1 * radius - epsilon, -epsilon]) {
            cube(size=[height + 2 * radius + epsilon, 1 * radius + epsilon, 1.0 + epsilon]);
        }

        translate([0.4 * height, 3.0 - radius, -epsilon]) {
            cube(size=[0.6 * height + radius + epsilon, 3.5, 1.0 + epsilon]);
        }

        start = 3.0 - radius + 1.0;
        for (i = [1:4]) {
            y = start + 3.5 * i;
            translate([0.4 * height, y, -epsilon]) {
                cube(size=[0.6 * height + radius + epsilon, 2.5, 1.0 + epsilon]);
            }
        }

        translate([0.925 * height, width / 2.0, 0.9*depth]) {
            linear_extrude(height=1.0) {
                polygon([[2.0, 0.0], [0.0, 2.0], [0.0, -2.0]]);
            }
        }

    }

    translate([0.20 * height, 0.5 * width, depth - 0.5]) {
        scale(v=[0.5, 0.5, 1.0]) {
            rotate(a=[0,0,90]){
                linear_extrude(height=0.5) {
                    text("Nentandu", size=5, halign="center");
                }
            }
        }
    }



    translate([0.40 * height, 0.5 * width, depth - 0.5]) {
        scale(v=[0.5, 0.5, 1.0]) {
            rotate(a=[0,0,90]){
                linear_extrude(height=0.5) {
                    multiline(line1, line2);
                }
            }
        }
    }

}

module multiline(line1, line2) {
    text(line1, size=5, halign="center");
    translate([0.0, -7.0, 0.0]) {
        text(line2, size=5, halign="center");
    }
}

//multiline("The Legend", "of Fejka");

cartridge("The Legend", "of Fejka");
