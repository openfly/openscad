
module curviture()
{
     difference() {
     
          translate([0,0,795]) sphere(r=600, $fn=100);
          translate([0,0,0]) cylinder (h = 1390, r=600, $fn=100);

     }

}

module amulet_body() {

cylinder(h = 10, r1 = 80, r2 = 80, $fn=100, center = true);
rotate_extrude(convexity = 10, $fn = 100)
translate([80, 0, 0])
circle(r = 6, $fn = 100);
translate([0, 0, -1385])
curviture();

translate([0, 90, 0]) {
rotate_extrude(convexity = 10, $fn = 100)
translate([10, 0, 0])
circle(r = 2, $fn = 100);
}

}

module double_long() {
    for(i = [
          [ 0, 0, 0],
          [ 5, 0, 0],
          [ -5, 0, 0]
            ])
    {
        rotate(i)
        cube([10, 126, 10], center = true, $fn=100);
    }
}

module long() {

    difference() {
        double_long();
        translate([0,-63,0]) cube([80,126,40], center = true, $fn=100);
    }

}

module quote() {

    difference() {
        long();
        translate([0,63,0]) cube([80,15,40], center = true, $fn=100);
    }

}

amulet_body();

rotate(a=[0,90,0]) {
    translate([  -6,  -110, 15]) quote();
    translate([  -6,  -110,-15]) quote();
}
