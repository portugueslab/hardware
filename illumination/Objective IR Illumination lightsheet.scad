r_obj = 15;
r_distance = 2;
r_out = 15/2;
led_r = 2.65;
n_nuts = 1;
n_leds = 6;
led_height = 10;
led_vertical_pos = -2;
offset_led = 0;
offset_nuts = -30;

// Nut trap module
// from: https://gist.github.com/Stemer114/324c382a528d10b43759
module nut_trap (w = 5.5, h = 3)
{
    cylinder(r = w / 2 / cos(180 / 6) + 0.05, h=h, $fn=6);
} 

// Set random color
color([0.5,0.5,0.5,1]) 
{
    difference() 
    {
        union () 
        {
            // Main cylinder
            cylinder(15, r_obj+r_distance*2, r_obj+r_distance*2, center=true, $fn=200);


            // Add LED holders
            for (a=[0:360/n_leds:359])
            {
                echo(a);
                translate([sin(a-offset_led)*(r_obj+r_distance*2.1),
                           cos(a-offset_led)*(r_obj+r_distance*2.1), led_vertical_pos]) 
                rotate([-42, 0, -a+offset_led])
                cylinder(led_height, led_r+r_distance/2, led_r+r_distance/2, $fn=200, center=true); 
            }
            
            // Extrude objective
            for (a=[0:360/n_nuts:359])
            {
                // Nut trap
                translate([sin(a+offset_nuts)*(r_obj+r_distance*2.7),
                           cos(a+offset_nuts)*(r_obj+r_distance*2.7), 2]) 
                
                rotate([90,0,-a-offset_nuts]) nut_trap(8); 
            }
            
            
        } // End backbone


        // Create hole in cylinder and remove LED mount overhang
        cylinder(30+.001, r_obj+r_distance, r_obj+r_distance, center=true, $fn=200);
        
        // Create nuts in circles around the center
        for (a=[0:360/n_nuts:359])
        {
            // Nut trap inside cylinder
            translate([sin(a+offset_nuts)*(r_obj+r_distance*2.3),
                       cos(a+offset_nuts)*(r_obj+r_distance*2.3), 2]) 
            
            rotate([90,0,-a-offset_nuts]) nut_trap(7); 
            
            // Opening for screw
            translate([sin(a+offset_nuts)*(r_obj+r_distance*2.8),
                       cos(a+offset_nuts)*(r_obj+r_distance*2.8), 2]) 
            rotate([90,0,-a-offset_nuts]) 
            cylinder(10,2,2, $fn=200, center=true); 
        }
        
        
        // Create LED holes in circle around the center
        for (a=[0:360/n_leds:359])
        {
            translate([sin(a-offset_led)*(r_obj+r_distance*2.1),
                       cos(a-offset_led)*(r_obj+r_distance*2.1), led_vertical_pos]) 
            rotate([-42,0,-a+offset_led]) 
            cylinder(led_height+4, led_r, led_r, $fn=200, center=true); 
        }
    
    } // End difference
} // End color