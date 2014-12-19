// Sony MDR-V6 Outer Ear Piece ( Casing )

module outerh() {
    // Hollow Shell
    translate([0, 0, 0]) {
           cylinder(h = 22, r1 = 29, r2 = 29, center = false, $fn=100);
    }
    // Mounting Plane
    translate([0,0,0]) {
        hull() {
            translate([12,0,0]) cylinder(h = 3, r1 = 37, r2 = 37, center = false, $fn=100);
            cylinder(h = 5, r1 = 37, r2 = 37, center = false, $fn=100);
            translate([-12,0,0]) cylinder(h = 3, r1 = 37, r2 = 37, center = false, $fn=100);
            cylinder(h = 5, r1 = 37, r2 = 37, center = false, $fn=100);            
        }
    }
}


// Main Recessed Area
module innerh() {
    cylinder(h = 20, r1 = 27, r2 = 27, center = false, $fn=100);
    hconn_hole();
}

module hconn_hole() {
    rotate(15, [0,0,1] ) {
        translate([0, 40, 16]) {
            rotate( 90, [1, 0, 0])
            cylinder(h = 80, r1 = 2.5, r2 = 2.5, center = false, $fn=100);
        }
    }
}

module hconn_lip() {
    rotate(15, [0,0,1] ) {
        translate([0, 50, -4]) {
            rotate( 90, [1, 0, 0])
            cube(size = [4,4,100], center = false, $fn=100);
        }
    }
}

module lip() {
    // Mounting Lip
    translate([-12,0,-2]) {
        hull() {
            translate([24,0,0]) cylinder(h = 2, r1 = 33, r2 = 33, center = false, $fn=100);
            cylinder(h = 2, r1 = 33, r2 = 33, center = false, $fn=100);
        }
    }
}

module lipcut() {
    translate([-12,0,-2]) {
        hull() {
            translate([24,0,0]) cylinder(h = 4, r1 = 32, r2 = 32, center = false, $fn=100);
            cylinder(h = 4, r1 = 32, r2 = 32, center = false, $fn=100);
        }
    }
}

// Cut into outter shell for inner recess main area

module main() {
    translate([0, 0, 0]) {
        difference() {
            outerh();
            innerh();
        }
    }
    translate([0, 0, 0]) {
        difference() {
            lip();
            hconn_lip();
        }
    }
}

// Cut into outter shell for lip cut
translate([0, distance, 0]) {
    difference() {
        main();
        lipcut();
    }
    screwplace();
}

// Screw Hole

module screwout() {
    cylinder(h = 4, r1 = 2.25, r2 = 2.25, center = false, $fn=100);
}

module screwin() {
    cylinder(h = 4, r1 = 1.5, r2 = 1.5, center = false, $fn=100);
}

module screwplace() {
    translate([32.5, 0, -2]) {
        difference() {
            screwout();
            screwin();
        }
    }
    translate([-32.5, 0, -2]) {
        difference() {
            screwout();
            screwin();
        }
    }
    translate([0, 30.5, -2]) {
        difference() {
            screwout();
            screwin();
        }
    }
    translate([0, -30.5, -2]) {
        difference() {
            screwout();
            screwin();
        }
    }
}

