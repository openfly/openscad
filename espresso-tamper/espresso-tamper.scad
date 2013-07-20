
module curviture()
{
     difference() {
     
          translate([0,0,798]) sphere(r=800, $fn=100);
          translate([0,0,0]) cylinder (h = 1800, r=800, $fn=100);

     }

}

module plunger()
{
      translate([0,0,90]) sphere(r=40, $fn=100);
      translate([0,0,10]) cylinder(h = 60, r1 = 57, r2 = 20,  $fn=100);
      translate([0,0,0]) cylinder(h = 10, r=57,  $fn=100);
}

curviture();
plunger();
