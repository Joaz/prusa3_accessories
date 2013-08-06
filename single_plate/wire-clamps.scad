$fn=64;

module long_slot(r,h,h2){
	hull(){
		cylinder(r=r,h=h);
		translate([0,-h2,0]) cylinder(r=r,h=h); 
	}
	
}

module big_part(){

	difference(){
        union(){
        	translate([-2,-10,0]) cube([55+10,4,8]);
		    translate([-2,0,0]) cube([55+10,8.5,8]);
		}
		translate([5.5,20,4]) rotate([90,0,0]) cylinder(r=1.9,h=40);
		translate([5.5+42.5,20,4]) rotate([90,0,0]) cylinder(r=1.9,h=40);
		translate([5.5,20,4]) rotate([90,0,0]) cylinder(r=3,h=13);
		translate([5.5+42.5,20,4]) rotate([90,0,0]) cylinder(r=3,h=13);

		translate([11,1.5,-0.1]) long_slot(r=4.5/2,h=20,h2=5);
		translate([17,1.25,-0.1]) long_slot(r=3.5/2,h=20,h2=5);
		translate([22.5,1.5,-0.1]) long_slot(r=4.5/2,h=20,h2=5);
		translate([28.5,1.5,-0.1]) long_slot(r=4.5/2,h=20,h2=5);
		translate([33.5,1.25,-0.1]) long_slot(r=3.5/2,h=20,h2=5);
		translate([38.0,1.25,-0.1]) long_slot(r=3.5/2,h=20,h2=5);
		translate([43.0,1.5,-0.1]) long_slot(r=4.5/2,h=20,h2=5);
    
	    translate([55.5,2.5,-0.1]) long_slot(r=9.0/2,h=20,h2=5);
    
	} 

}

module small_part(){
    difference(){
        cube([34,10,8]);
        translate([4,20,4]) rotate([90,0,0]) cylinder(r=1.7,h=30);
		translate([4,20,4]) rotate([90,0,0]) cylinder(r=3,h=13);
	    
	    translate([9.5,1.5,-0.1]) long_slot(r=4.5/2,h=20,h2=5);
	    translate([15,1.5,-0.1]) long_slot(r=4.5/2,h=20,h2=5);
		translate([20,1.25,-0.1]) long_slot(r=3.5/2,h=20,h2=5);
		translate([27,1.25,-0.1]) long_slot(r=7.0/2,h=20,h2=5);

    }    
}

big_part();
//translate([0,12,0]) big_part();
//small_part();


