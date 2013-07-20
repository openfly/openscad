
difference() {

  cylinder(h = 10, r1 = 80, r2 = 85, $fn=100, center = false);

  rotate_extrude(convexity = 10, $fn = 100)
  translate([25, 0, 0]) 
  circle(r = 3, $fn = 100);

  rotate_extrude(convexity = 10, $fn =100)
  translate([60, 0, 0])
  circle(r = 3, $fn = 100);

  for ( i = [0 : 2] )
 {
    rotate( i * 360 / 3, [0, 0, 1], $fn = 100)
    translate([60, 0, 0])
    sphere(r = 9);
 }

  for ( i = [0 : 2] )
 {
    rotate( i * 360 / 3, [0, 0, 1], $fn = 100)
    translate([25, 0, 0])
    rotate(90, [0,1,0]) cylinder(h = 35, r1 = 3, r2 = 3, $fn=100, center = false);
 }

}

rotate_extrude(convexity = 10, $fn = 100)
translate([80, 0, 0])
circle(r = 1, $fn = 100);
