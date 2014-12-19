
difference() {

  cylinder(h =40, r1 = 100, r2 = 110, $fn=100, center = false);

  rotate_extrude(convexity = 10, $fn = 100)
  translate([25, 0, 0]) 
  circle(r = 3, $fn = 100);

  rotate_extrude(convexity = 10, $fn =100)
  translate([60, 0, 0])
  circle(r = 3, $fn = 100);

  for ( i = [0 : 2] )
 {
    rotate( i * 360 / 3, [0, 0, 1], $fn = 100)
    translate([75, 0, 0])
    sphere(r = 20);
 }

  for ( i = [0 : 2] )
 {
    rotate( i * 360 / 3, [0, 0, 1], $fn = 100)
    translate([25, 0, 0])
    rotate(90, [0,1,0]) cylinder(h = 35, r1 = 3, r2 = 3, $fn=100, center = false);
 }

}

rotate_extrude(convexity = 10, $fn = 100)
translate([100g, 0, 0])
circle(r = 1, $fn = 100);
