// Sony MDR-V6 Outer Ear Piece ( Casing )

module outerh() {
    // Hollow Shell
    translate([-14, -18, 13]) kross_housing();

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
    translate([-12, -15, 15]) kross_cutout();
    translate([-6.75, -9, 15]) usb_hole();
    cylinder(h = 20, r1 = 27, r2 = 27, center = false, $fn=100);
    hconn_hole();
}

module usb_hole() {
    cube(size = [100,8.5,3.25], center = false, $fn=100);
}

module hconn_hole() {
    rotate(-15, [0,0,1] ) {
        translate([0, 40, 16]) {
            rotate( 90, [1, 0, 0])
            cylinder(h = 80, r1 = 2.5, r2 = 2.5, center = false, $fn=100);
        }
    }
}

module button_hole() {
    translate([-14,0,19]) cylinder(h = 4, r1 = 3.5, r2 = 3.5, center = false, $fn=100);
}

module hconn_lip() {
    rotate(15, [0,0,1] ) {
        translate([0, 50, -4]) {
            rotate( 90, [1, 0, 0])
            cube(size = [4,4,100], center = false, $fn=100);
        }
    }
}

module buttonhole1() {
    cylinder(h = 10, r1 = 6.8, r2 = 6.8, center = false, $fn=100);
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
            button_hole();
        }
        translate([-3,-2,14]) mountings();
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

module kross_housing() {
    cube(size = [44,36,9], center = false, $fn=100);
}

module kross_cutout() {
    cube(size = [40,32,5], center = false, $fn=100);
}

// board mounting pegs
module fmntpeg() {
    translate([2,0,3]) cube(size = [21,3,3], center = false, $fn=100);
    difference() {
        cube(size = [3,3,6], center = false, $fn=100);
        translate([0,0,3]) cube(size = [1,3,2], center = false, $fn=100);
        translate([0,1,1.9]) rotate(180, [1,0,0]) polyhedron ( points = [[0, -3, 2], [0, 3, 2], [0, 3, 0], [0, -3, 0], [3, -3, 2], [3, 3, 2]], 
triangles = [[0,3,2], [0,2,1], [3,0,4], [1,2,5], [0,5,4], [0,1,5],  [5,2,4], [4,2,3], ]);
    }
}

module rmntpeg() {
    difference() {
        cube(size = [3,3,6], center = false, $fn=100);
        translate([0,0,3]) cube(size = [1,3,2], center = false, $fn=100);
    }
}

module mountings() {
    translate([0,13,0]) rotate( 180, [0, 0, 1]) fmntpeg();
    translate([0,-7,0]) rotate( 180, [0, 0, 1]) fmntpeg();
    translate([30,10,0]) rmntpeg();
    translate([30,-10,0]) rmntpeg();
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

