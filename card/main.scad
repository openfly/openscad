include <OpenScadFont.scad>;
include <logo.scad>;


translate([0,-60,0]) {
  logo();
}

difference() {

  translate([-50,-100,2]) cube([100, 200, 3]);

  translate([12,-10,5]) 
  rotate(180,  [0, 1, 0]) {

    translate([0,0,0]) {
      fnt_str(["M","a","t","t"," ", "J", "o", "y", "c", "e"],10,1,3);
    }

    translate([15,0, 0]) {
      fnt_str(["m", "a", "t", "t", "@", "n", "y", "c", "r", "e", "s", "i", "s", "t", "o", "r", ".", "c", "o", "m" ],20,1,3);
    }

    translate([30,0,0]) {
      fnt_str(["9","1","7",".","5","9","6",".","9","6","1","9"],12,1,3);  
    }

  }

}