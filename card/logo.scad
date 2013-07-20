
module logo() {

  difference() {

    cylinder(h =5, r1 = 40, r2 = 42, $fn=100, center = false);

    rotate_extrude(convexity = 10, $fn = 100)
    translate([10, 0, 0]) 
    circle(r = 2, $fn = 100);

    rotate_extrude(convexity = 10, $fn =100)
    translate([20, 0, 0])
    circle(r = 2, $fn = 100);

    for ( i = [0 : 2] ) {
      rotate( i * 360 / 3, [0, 0, 1], $fn =20)
      translate([28.5, 0, 0]) {
        cylinder(h =2, r1 = 6, r2 = 6, $fn=100, center = false);
        rotate_extrude(convexity = 10, $fn = 100)
        translate([6, 0, 0]) 
        circle(r = 2, $fn = 100);
      }
      rotate( i * 360 / 3, [0, 0, 1], $fn = 100)
      translate([10, 0, 0])
      rotate(90, [0,1,0]) 
      cylinder(h = 20, r1 = 2, r2 = 2, $fn=100, center = false);
    }

  }

  rotate_extrude(convexity = 10, $fn = 100)
  translate([40, 0, 0])
  circle(r = 1, $fn = 100);
}
