module complete_body()
{
  difference()
  {
    union()
    {
      // lower body
      hull()
      {
        sphere(d = 20.0, $fn = 42);
        translate([0.0, 0.0, -24.0]) sphere(d = 20.0, $fn = 42);
      }

      // head structure
      hull()
      {
        translate([0.0, 0.0, 6.61]) sphere(d = 24.0, $fn = 42);
        translate([0.0, 0.0, 6.61 + 25.0]) cylinder(h = 0.1, d = 7.5, $fn = 42);
      }

      // head key mount combiner
      translate([0.0, 0.0, 6.61 + 25.0]) cylinder(h = 6.3, d = 7.5, $fn = 42);

      // key mount
      intersection()
      {
        translate([0.0, 0.0, 6.61 + 25.0 + 6.3]) scale([3,1,1]) sphere(d = 8.0, $fn = 42);
        translate([0.0, 0.0, 6.61 + 25.0 + 6.3]) scale([1,3,3]) sphere(d = 8.0, $fn = 42);
      }

      // eyes
      for (i = [-1.0, 1.0])
      {
        translate([i * 4.33, -10.5, 8.4]) sphere(d = 2.9, $fn = 100);
      }

      // mouth
      translate([0, -9.5, 2.2]) cube([15.0, 5.0, 2.0], center = true);
    }

    // space for key mount
    translate([0.0, 0.0, 6.61 + 25.0 + 6.3])
      rotate([0.0, 90.0, 0.0])
      cylinder(h = 9.0, d = 3.0, center = true, $fn = 42);
  }
}

module screw()
{
  translate([0.0, 0.0, 0.0]) union()
  {
    for (i = [0:3])
    {
      rotate([0.0, 0.0, i * 90.0]) union()
      {
        translate([7.0, 0.0, 0.0]) rotate([0.0, 180.0, 0.0]) cylinder(h = 20.0, d = 2.9, $fn = 200);
        translate([7.0, 0.0, 0.0]) cylinder(h = 10.0, d = 3.3, $fn = 200);
        translate([7.0, 0.0, 10.0]) cylinder(h = 20.0, d = 4.3, $fn = 200);
      }
    }
  }
}

module upper_body()
{
  difference()
  {
    intersection()
    {
      translate([0.0, 0.0, 25.0]) cube([40.0, 40.0, 50.0], center = true);
      complete_body();
    }

    screw();
  }
}

module lower_body()
{
  difference()
  {
    intersection()
    {
      translate([0.0, 0.0, -25.0]) cube([40.0, 40.0, 50.0], center = true);
      complete_body();
    }
    screw();
  }
}

upper_body();

lower_body();
