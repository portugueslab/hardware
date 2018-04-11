// Diameter, rim and height [mm]
w   = 50;
rim = 1;
h   = 10;
plate = 1;
acrylic = 2.3;

font = "Liberation Sans";

cube_size = 60;
letter_size = 3;
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


{
                // Tube
    color([0.7,0.7,0.7,1]) {
        difference() {
            
            
    // BASE CHAMBER AND TUBE        
    union() {
        
    // BASE CHAMBER    
	difference()  {
        translate([0,2.,0]) {
        cube([w,w+5,h],center=true, $fn=200);
        }
        
        // INSET, "HOLE" in the center
		translate([0,3,plate]){
			cube([w-2*rim,w-10*rim,h], center=true, $fn=200);
		}

        // BASE PLATE
		translate([0,3,-plate]){
			cube([w-8*rim,w-15*rim,h], center=true, $fn=200);
		}
        
        

		translate([25,2.5,plate*3]){
			cube([w+10*rim,w-25*rim,h], center=true, $fn=200);
		}
	}


        //translate([6,-14.5,-2]) {
        //#    rotate([90,0,0]) {
        //#        letter("anki.v3");
        //#    }
        //#}
	
    
    // Outer TUBE
        translate([0,-27,plate+acrylic+1.2-3.4])
        {
            rotate([90,0,0]) 
            {
                cylinder(20, 5, 5, center=true, $fn=200);
                
            }
        }   
    }
            

    union() {// Remove inner tube
    translate([0,-26,plate+acrylic+1.2-3.65])
    {
        rotate([90,0,0]) 
        {
            cylinder(25, 2.05, 2.05, center=true, $fn=200);
            //cylinder(25, 1.6, 1.6, center=true, $fn=200);
        }
    }     
    
    translate([12,-22,4.8]) {
        rotate([0,0,0]) {
            letter("gasket");
        }
    } }
    
    
    /*translate([0,-26,plate+acrylic+1.2-7.05])
    {
        rotate([90,0,0]) 
        {
            cylinder(25, 2.7/2, 2.7/2, center=true, $fn=200);
            
        }
    } */    
    //End color
    
    }}//End color
    
    
    /*   
      
    
    // Glass
    
    color([0.1,0.8,0.8,.3]) {    
    translate([w*0.5+.2,2.5+.5*rim]){
			cube([0.5*rim,w-20*rim,h-rim], center=true, $fn=200);
		}
    
    }
    
    
    
    
    // ACRYLIC
    
    color([1,1,1,.3]) {    
    translate([0,3,-h/2+acrylic]){
			cube([w-2*rim,w-10*rim,2.3], center=true, $fn=200);
		}
    
    } */
}



