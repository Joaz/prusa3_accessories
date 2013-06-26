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

    opening_size = shaft_radius*2-1.2; //openingsize

    segments=64;

    difference(){
	    union(){

	        translate([outer_diameter, outer_diameter, 0]) cylinder(h =10, r = outer_diameter, $fn = segments); 
		    
		    translate([outer_diameter, 0, 0]) cube([15.5,outer_diameter*2,10]);
slate([17, opening_size-4, 5]) rotate([90, 0, 0]) cylinder(h =5, r = 5.77, $fn = 6);
	    }

        translate([9, outer_diameter-opening_size/2, 0]) cube([18,opening_size,20]);
	    translate([outer_diameter, outer_diameter, 0]) cylinder(h =20, r = shaft_radius, $fn = segments);

	    //Securing hole
	    translate([17, 20, 5]) rotate([90, 0, 0]) cylinder(h =20, r = m3_diameter/2, $fn = segments);
	    translate([17, opening_size-6, 5]) rotate([90, 0, 0]) cylinder(h =5, r = m3_nut_diameter_horizontal/2, $fn = 6);

	    translate([17, 17, 5]) rotate([90, 0, 0]) cylinder(h =20, r = m3_diameter/2, $fn = segments);

	
    }
}

module rrd_endstop_base(thickness=4){
    screw_hole_spacing = 20;
    screw_hole_spacing2 = 10;
    segments = 64;
		    // for rrd endstops
	difference(){
		    union(){
		        translate([-30, 0, 0]) cube([40, thickness, 10]);
		        translate([-8, 0, 0]) cube([6, thickness, 19]);
		        translate([-28, 0, 0]) cube([6, thickness   , 19]);
		        translate([-5, thickness, 5+13]) rotate([90, 0, 0]) cylinder(h =thickness, r = 4, $fn = segments);
        	    translate([-(5+screw_hole_spacing), thickness, 5+13]) rotate([90, 0, 0]) cylinder(h =thickness, r = 4, $fn = segments);
		        
		   }
        translate([-5, 17, 5+13]) rotate([90, 0, 0]) cylinder(h =20, r = m3_diameter/2, $fn = segments);
	    translate([-(5+screw_hole_spacing), 17, 5+13]) rotate([90, 0, 0]) cylinder(h =20, r = m3_diameter/2, $fn = segments);
    }
		   

}

// for z
module z_endstop(){
    union(){
        translate([-1,10,0]) rotate([0,0,-90]) rrd_endstop_base(4);
        endstop(4.15);
    }
}


module x_endstop(){
    union(){
        translate([3,-14,0]) rotate([0,0,90]) rrd_endstop_base(4);
        translate([0,-15,0]) rotate([0,0,0]) endstop(4.15);
    }
}

module y_endstop(){
    union(){
       translate([-18,10,0]) rotate([0,0,-90]) rrd_endstop_base(4);
        translate([-15,0,0]) cube([18,40,10]);
        translate([0,15,10]) rotate([180,0,0]) endstop(5.1);
    }
}

z_endstop();

//y_endstop();
//x_endstop();



