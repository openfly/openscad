// Hack RF Case - openfly


// 148 x 74
pad = 0.1;	// Padding to maintain manifold
box_l = 156;	// Length
box_w = 80;	// Width
box_h = 12;	// Height
round_r = 2;	// Radius of round
smooth = 45;	// Number of facets of rounding cylinder

//screwholes();
place_screwholes();

// Catarina Mota's Function - Vai Catarina!
// size is the XY plane size, height in Z
module hexagon(size, height) {
  boxWidth = size/1.75;
  for (r = [-60, 0, 60]) rotate([0,0,r]) cube([boxWidth, size, height], true);
}

module place_screwholes() {
    screwplace();
    difference() {
        cutout_top();
        screwholes();
    }
}

module cutout_top() {
    difference() {
        top();
        outer_shell(0.1, 152, 76, 6, round_r, smooth);
    }
}

module top() {
    difference() { 
        outer_shell(pad, box_l, box_w, box_h, round_r, smooth);
        translate([0,0,-3])
            cube([156, 80, 6], fn=100, center=true);
    }
}

module outer_shell(pad, box_l, box_w, box_h, round_r, smooth) {
// To fix the corners cut the main cube with smaller cubes with spheres remove
    difference() {
        cube([box_l, box_w, box_h], center = true);

        translate([0, -box_w/2+round_r, box_h/2-round_r]) {
            difference() {
                translate([0,-round_r-pad,round_r+pad])
                cube([box_l+2*pad, round_r*2+pad, round_r*2+pad], center = true);
                     rotate(a=[0,90,0])
                cylinder(box_l+4*pad,round_r,round_r,center=true,$fn=smooth);
            }
        }
        translate([0, box_w/2-round_r, box_h/2-round_r]) {
            difference() {
                translate([0,round_r+pad,round_r+pad])
                    cube([box_l+2*pad, round_r*2+pad, round_r*2+pad], center = true);
                rotate(a=[0,90,0])
                cylinder(box_l+4*pad,round_r,round_r,center=true,$fn=smooth);
            }
        }
        translate([0, -box_w/2+round_r, -box_h/2+round_r]) {
            difference() {
                translate([0,-round_r-pad,-round_r-pad])
                    cube([box_l+2*pad, round_r*2+pad, round_r*2+pad], center = true);
                rotate(a=[0,90,0])
                    cylinder(box_l+4*pad,round_r,round_r,center=true,$fn=smooth);
            }
        }
        translate([0, box_w/2-round_r, -box_h/2+round_r]) {
            difference() {
                translate([0,round_r+pad,-round_r-pad])
                    cube([box_l+2*pad, round_r*2+pad, round_r*2+pad], center = true);
                rotate(a=[0,90,0])
                cylinder(box_l+4*pad,round_r,round_r,center=true,$fn=smooth);
            }
        }

        translate([-box_l/2+round_r, box_w/2-round_r, 0]) {
            difference() {
                translate([-round_r-pad,round_r+pad,0])
                    cube([round_r*2+pad, round_r*2+pad, box_h+2*pad], center = true);
                cylinder(box_h+4*pad,round_r,round_r,center=true,$fn=smooth);
            }
        }
        translate([box_l/2-round_r, box_w/2-round_r, 0]) {
            difference() {
                translate([round_r+pad,round_r+pad,0])
                    cube([round_r*2+pad, round_r*2+pad, box_h+2*pad], center = true);
                cylinder(box_h+4*pad,round_r,round_r,center=true,$fn=smooth);
            }
        }
    
        translate([-box_l/2+round_r, -box_w/2+round_r, 0]) {
            difference() {
                translate([-round_r-pad,-round_r-pad,0])
                    cube([round_r*2+pad, round_r*2+pad, box_h+2*pad], center = true);
                cylinder(box_h+4*pad,round_r,round_r,center=true,$fn=smooth);
            }
        }
        translate([box_l/2-round_r, -box_w/2+round_r, 0]) {
            difference() {
                translate([round_r+pad,-round_r-pad,0])
                    cube([round_r*2+pad, round_r*2+pad, box_h+2*pad], center = true);
                cylinder(box_h+4*pad,round_r,round_r,center=true,$fn=smooth);
            }
        }

        translate([-box_l/2+round_r, 0, box_h/2-round_r]) {
            difference() {
                translate([-round_r-pad, 0, round_r+pad])
                    cube([round_r*2+pad, box_w+2*pad, round_r*2+pad], center = true);
                rotate(a=[0,90,90])
                    cylinder(box_w+4*pad,round_r,round_r,center=true,$fn=smooth);
            }
        }
        translate([box_l/2-round_r, 0, box_h/2-round_r]) {
            difference() {
                translate([round_r+pad, 0, round_r+pad])
                    cube([round_r*2+pad, box_w+2*pad, round_r*2+pad], center = true);
                rotate(a=[0,90,90])
                    cylinder(box_w+4*pad,round_r,round_r,center=true,$fn=smooth);
            }
        }
        translate([-box_l/2+round_r, 0, -box_h/2+round_r]) {
            difference() {
                translate([-round_r-pad, 0, -round_r-pad])
                    cube([round_r*2+pad, box_w+2*pad, round_r*2+pad], center = true);
                rotate(a=[0,90,90])
                    cylinder(box_w+4*pad,round_r,round_r,center=true,$fn=smooth);
            }
        }
        translate([box_l/2-round_r, 0, -box_h/2+round_r]) {
            difference() {
                translate([round_r+pad, 0, -round_r-pad])
                    cube([round_r*2+pad, box_w+2*pad, round_r*2+pad], center = true);
                rotate(a=[0,90,90])
                    cylinder(box_w+4*pad,round_r,round_r,center=true,$fn=smooth);
            }
        }

        translate([box_l/2-round_r, box_w/2-round_r, box_h/2-round_r]) {
            difference() {
                translate([round_r+pad, round_r+pad, round_r+pad])
                    cube([round_r*2+pad, round_r*2+pad, round_r*2+pad], center = true);
                sphere(round_r,center=true,$fn=smooth);
            }
        }
        translate([-box_l/2+round_r, box_w/2-round_r, box_h/2-round_r]) {
            difference() {
                translate([-round_r-pad, round_r+pad, round_r+pad])
                    cube([round_r*2+pad, round_r*2+pad, round_r*2+pad], center = true);
                sphere(round_r,center=true,$fn=smooth);
            }
        }
        translate([box_l/2-round_r, -box_w/2+round_r, box_h/2-round_r]) {
            difference() {
                translate([round_r+pad, -round_r-pad, round_r+pad])
                    cube([round_r*2+pad, round_r*2+pad, round_r*2+pad], center = true);
                sphere(round_r,center=true,$fn=smooth);
            }
        }
        translate([-box_l/2+round_r, -box_w/2+round_r, box_h/2-round_r]) {
            difference() {
                translate([-round_r-pad, -round_r-pad, round_r+pad])
                    cube([round_r*2+pad, round_r*2+pad, round_r*2+pad], center = true);
                sphere(round_r,center=true,$fn=smooth);
            }
        }

        translate([box_l/2-round_r, box_w/2-round_r, -box_h/2+round_r]) {
            difference() {
                translate([round_r+pad, round_r+pad, -round_r-pad])
                    cube([round_r*2+pad, round_r*2+pad, round_r*2+pad], center = true);
                sphere(round_r,center=true,$fn=smooth);
            }
        }
        translate([-box_l/2+round_r, box_w/2-round_r, -box_h/2+round_r]) {
            difference() {
                translate([-round_r-pad, round_r+pad, -round_r-pad])
                    cube([round_r*2+pad, round_r*2+pad, round_r*2+pad], center = true);
                sphere(round_r,center=true,$fn=smooth);
            }
        }
        translate([box_l/2-round_r, -box_w/2+round_r, -box_h/2+round_r]) {
            difference() {
                translate([round_r+pad, -round_r-pad, -round_r-pad])
                    cube([round_r*2+pad, round_r*2+pad, round_r*2+pad], center = true);
                sphere(round_r,center=true,$fn=smooth);
            }
        }
        translate([-box_l/2+round_r, -box_w/2+round_r, -box_h/2+round_r]) {
            difference() {
                translate([-round_r-pad, -round_r-pad, -round_r-pad])
                    cube([round_r*2+pad, round_r*2+pad, round_r*2+pad], center = true);
                sphere(round_r,center=true,$fn=smooth);
            }
        }
    }
}

module screwout() {
    cylinder(h = 3, r1 = 3, r2 = 3, center = false, $fn=100);
}

module screwin() {
    cylinder(h = 12, r1 = 2, r2 = 2, center = false, $fn=100);
}

// 140 x 65.5
module screwplace() {
    translate([70, 32.75, 1]) {
        difference() {
            screwout();
            screwin();
        }
    }
    translate([70, -32.75, 1]) {
        difference() {
            screwout();
            screwin();
        }
    }
    translate([-70, 32.75, 1]) {
        difference() {
            screwout();
            screwin();
        }
    }
    translate([-70, -32.75, 1]) {
        difference() {
            screwout();
            screwin();
        }
    }
}

module screwholes() {
    translate([70, 32.75, 1]) {
        screwin();
    }
    translate([70, 32.75, 6]) {
        hexagon(5.4, 2.4); 
    }
    translate([70, -32.75, 1]) {
        screwin();
    }
    translate([70, -32.75, 6]) {
        hexagon(5.4, 2.4); 
    }
    translate([-70, 32.75, 1]) {
        screwin();
    }
    translate([-70, 32.75, 6]) {
        hexagon(5.4, 2.4); 
    }
    translate([-70, -32.75, 1]) {
        screwin();
    }
    translate([-70, -32.75, 6]) {
        hexagon(6, 2.5); 
    }
}