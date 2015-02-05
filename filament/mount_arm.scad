
module rod_hole() {
    translate([-20,0,-25]) {
        cylinder(h=50, r=10, $fn=100, center = false);
    }
    rotate(a=[0,0,125]) translate([10,6,-25]) {
        cube(size = [50,20,40], center = false);
    }
}

module style_cut() {
    translate([200,200,0])
    cylinder(h=20, r=100, $fn=100, center = true);
}

module diag() {
        translate([200,200,0])
        rotate(a=[0,0,45])
        cube(size = [560,800,20], center = true);
}

module cdiag() {
        translate([200,-200,0])
        rotate(a=[0,0,45])
        cube(size = [800,560,20], center = true);
}

module mount_wall() {
    difference(){
        difference(){
            cube(size = [560,560,20], center = true);
            diag();
        }
        cdiag();
    }
    translate([-20,0,0]) cylinder(h=20, r=20, $fn=100, center = true);
}

module slim_wall() {
    difference(){
        difference(){
            mount_wall();
            translate([0,-300,0]) cube(size = [560,560,20], center = true);
        }
        translate([0,300,0]) cube(size = [560,560,20], center = true);
    }
} 

module hole_panel() {
    difference(){
        slim_wall();
        rod_hole(); 
        translate([-40,0,0]) rod_hole();    
        translate([-80,0,0]) rod_hole();    
    }
}

module full_arm() {
    difference(){
        hole_panel();
        style_cut();
    }
}

module arm_mount() {
    translate([-270,0,0]) cube(size = [20,150,20], center = true);
}

module screw_hole() {
    rotate([0,90,0]) cylinder(h=20, r=1.75, $fn=100, center = true);
}

module screw_mount() {
    difference() {
    difference() {
        arm_mount();
        translate([-270,65,0]) screw_hole();
    }
    translate([-270,-65,0]) screw_hole();
    }
}

full_arm();
screw_mount();