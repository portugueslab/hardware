// Diameter, rim and height [mm]
w   = 29.6;
rim = 1;
h   = 10;
plate = 1;

font = "Liberation Sans";

cube_size = 60;
letter_size = 2.5;
letter_height = 3;

// Press F5 to get a colored preview
// Press F6 to get a rendered preview

module letter(l) {
	// Use linear_extrude() to make the letters 3D objects as they
	// are only 2D shapes when only using text()
	linear_extrude(height = letter_height) {
		text(l, size = letter_size, font = font, halign = "center", valign = "center", $fn = 200);
	}
}


color([0.5,0.5,0.5,0.3]) {
	difference()  {
		cube([w,w,h],center=true, $fn=200);
        
        // INSET, "HOLE" in the center
		translate([0,0,plate]){
			cube([w-2*rim,w-2*rim,h], center=true, $fn=200);
		}

        // BASE PLATE
		translate([0,0,-plate]){
			cube([w-8*rim,w-8*rim,h], center=true, $fn=200);
		}

        // Window 1
		translate([20,0,plate*3]){
			cube([w+20*rim,w-22*rim,h], center=true, $fn=200);
		}

        // Window 2
		translate([0,20,plate*3]){
			cube([w-22*rim,w+20*rim,h], center=true, $fn=200);
		} 
        
        translate([0,-14.5,-2]) {
            rotate([90,0,0]) {
                letter(str("anki.v3  ",h,"mm"));
            }
        }
	}
}