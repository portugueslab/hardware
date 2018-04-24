/*
 * Pump Adapter for connecting different tubes
 * anki and daniil, april 2018
 */
difference() {
    
    union() {
        // Port A
        cylinder(2.5, 2.26/2, 1.36/2, $fn=200);
        translate([0,0, -2.5]) cylinder(2.5, 2.0/2, 2.0/2, $fn=200);
        
        // Middle part
        translate([0,0, -7.5]) cylinder(5, 2, 2, $fn=200);

        // Port B
        rotate([0, 180, 0]) translate([0,0,9.5]) {
            cylinder(2.5, 2.26/2, 1.36/2, $fn=200);
            translate([0,0, -2.5]) cylinder(2.5, 2.0/2, 2.0/2, $fn=200);
            }
        }

    // hole in the center
    translate([0,0, -15]) cylinder(32, 1.1/2, 1.1/2, $fn=200);
}

// Add a second version next to it
translate([5, 0, 0]){
    difference() {
        
        union() {
            // Port A, but fitting smaller tube
            cylinder(2.5, 1.5/2, 0.65/2, $fn=200);
            translate([0,0, -2.5]) cylinder(2.5, 1.3/2, 1.3/2, $fn=200);
            // Middle part
            translate([0,0, -7.5]) cylinder(5, 2, 2, $fn=200);
            // Port B
            rotate([0, 180, 0]) translate([0,0,9.5]) {
                cylinder(2.5, 2.26/2, 1.36/2, $fn=200);
                translate([0,0, -2.5]) cylinder(2.5, 2.0/2, 2.0/2, $fn=200);
            }
        }   

        // hole in the center, smaller (500 microns)
        translate([0,0, -15]) cylinder(32, 0.5/2, 0.5/2, $fn=200);
    }
}