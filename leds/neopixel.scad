/*
 * Neopixel LED Library
 *
 * Includes modules for
 *  - a single square LED
 *  - square LED on a PCB breakout
 */

// Small positive value constant
eps=0.1;

$fn=50;

module neopixel_led(center=false, color="silver") {
    // The square neopixel - https://cdn-shop.adafruit.com/datasheets/WS2812B.pdf
    // Values in mm
    square_width = 5.0;
    square_height = 5.0;

    full_height = 2.8;
    pcb_height = 1.4;
    led_height = full_height-pcb_height;

    translate(center ? [-square_width/2, -square_height/2, 0] : [0, 0, 0])
        difference() {
            color("white")
                linear_extrude(led_height)
                square([square_width, square_height]);

            color(color)
                translate([square_width/2, square_height/2, led_height-0.1])
                linear_extrude(0.1 + eps)
                circle(d=0.9*square_width);
        }
}

module neopixel_led_breakoff(color="silver") {
    // https://www.amazon.com/gp/product/B01DC0J0WS
    // Values in mm
    pcb_diameter = 10;
    pcb_height = 1.4;
    union() {
        color("lavender")
            linear_extrude(pcb_height)
            circle(d=pcb_diameter);

        translate([0, 0, pcb_height])
            neopixel_led(center=true, color=color);
    }
}

translate([20,0,0])
    neopixel_led(color="red");

translate([10,0,0])
    neopixel_led(center=true, color="green");

neopixel_led_breakoff(color="royalblue");
