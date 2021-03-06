// PRUSA Mendel  
// Endstop holder
// Used to attach endstops to 8mm rods
// GNU GPL v3
// Josef Průša
// josefprusa@me.com
// prusadjs.cz
// http://www.reprap.org/wiki/Prusa_Mendel
// http://github.com/prusajr/PrusaMendel

include <../configuration.scad>

/**
 * This endstop holder has 3 holes for endstops with either 10mm or 20mm spacing
 * @id endstop-holder
 * @name Endstop holder
 * @category Printed
 * @using 1 m3x20xhex
 * @using 1 m3nut
 * @using 2 m3washer
 */
module endstop(shaft_radius){
    shaft_diameter=shaft_radius*2;
    outer_diameter = shaft_diameter/2+3.3;
    screw_hole_spacing = 20;
    screw_hole_spacing2 = 10;
    opening_size = shaft_radius*2-1.5; //openingsize
    additional_height=10;
    segments=64;

    difference(){
	    union(){


		    translate([outer_diameter, outer_diameter, 0]) cylinder(h =10, r = outer_diameter, $fn = segments);
		    translate([outer_diameter, 0, 0]) cube([15.5,outer_diameter*2,10]);
		    translate([-30-5, 0, 0]) cube([40+5, 8, 10+additional_height]);
		    // for rrd endstops
		    translate([-8-5, 0, additional_height]) cube([6, 8, 19]);
		    translate([-28-5, 0, additional_height]) cube([6, 8, 19]);
		    translate([-10, 8, 5+13+additional_height]) rotate([90, 0, 0]) cylinder(h =8, r = 4, $fn = segments);
    	    translate([-(10+screw_hole_spacing), 8, 5+13+additional_height]) rotate([90, 0, 0]) cylinder(h =8, r = 4, $fn = segments);
		    
		    translate([17, 10+opening_size, 5]) rotate([90, 0, 0]) cylinder(h =5, r = 5.77, $fn = 6);
	    }




	    translate([9, outer_diameter-opening_size/2, 0]) cube([18,opening_size,20]);
	    translate([outer_diameter, outer_diameter, 0]) cylinder(h =20+additional_height, r = shaft_radius, $fn = segments);

	    //Securing hole
	    translate([17, 20, 5]) rotate([90, 0, 0]) cylinder(h =20, r = m3_diameter/2, $fn = segments);
	    translate([17, 12+opening_size, 5]) rotate([90, 0, 0]) cylinder(h =5, r = m3_nut_diameter_horizontal/2, $fn = 6);

	    translate([17, 17, 5]) rotate([90, 0, 0]) cylinder(h =20, r = m3_diameter/2, $fn = segments);
	    // Endstop holders
	    translate([-5-5, 17, 5+13+additional_height]) rotate([90, 0, 0]) cylinder(h =20, r = m3_diameter/2, $fn = segments);
	    translate([-(10+screw_hole_spacing), 17, 5+13+additional_height]) rotate([90, 0, 0]) cylinder(h =20, r = m3_diameter/2, $fn = segments);
	    
	
    }
}

endstop(bushing_z[0]);
//translate([0,20,0]) endstop(bushing_xy[0]);
//translate([0,40,0]) endstop(bushing_z[0]);

