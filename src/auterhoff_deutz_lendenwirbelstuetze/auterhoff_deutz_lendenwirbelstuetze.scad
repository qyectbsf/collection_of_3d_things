module base_form(a)
{
  // create 2d shape
  rotate([0.0, 0.0, 90.0])
    projection()
    minkowski()
  {
    //define points
    scale([0.71, 0.1, 1.0])
      rotate_extrude(angle = a, convexity = 10.0, $fn = 60.0)
      translate([100.0, 0.0, 0.0])
      square([0.02, 4.0]);

    // cylinder to set at points
    cylinder(h = 4.0, r = 4.0, $fn = 50.0);
  }
}

module extruded_form()
{
  translate([0.0, -900.0 - 3.0, 0.0]) union()
  {
    // create the middle shape out of base form
    a = 11.4;
    rotate([0.0, 0.0, 90.0 - a / 2.0])
      rotate_extrude(angle = a, convexity = 10.0, $fn = 420.0)
      translate([900.0, 0.0, 0.0])
      base_form(180.0);

    // create to two side round offs
    for (i = [-1.0, 1.0])
    {
      a = 180.0;
      rotate([0.0, 0.0, i * -5.699])
        translate([0.0, 900.0, 0.0])
        rotate([90.0, i * 90.0, 0.0])
        rotate_extrude(angle = a, convexity = 10.0, $fn = 42.0)

      difference()
      {
        rotate([0.0, 0.0, -90.0])
          base_form(90.0);
        translate([-20.0, 0.0, 0.0])
          square([20.0, 20.0]);
      }
    }
  }
}

module rev1()
{
  difference()
  {
    cube([51.8, 20.0, 136.0], center = true);
    cube([40.0, 20.0, 53.4], center = true);
    translate([0.0, 0.6, 0.0])
      rotate([0.0, 90.0, 0.0])
      cylinder(d = 6.4, h = 80.0, $fn = 200, center = true);
  }
}

module rev2()
{
  difference()
  {
    union()
    {
      cube([52.0, 19.9, 52.0], center = true);
      for (i = [0:3])
      {
        hull()
        {
          rotate([0.0, i * 90.0, 0.0])
            translate([23.0, -0.05, 23.0])
            cube([6.0, 20.0, 6.0], center = true);
          rotate([0.0, i * 90.0, 0.0])
            translate([70.0, -4.3, 70.0])
            cube([6.0, 5.0, 6.0], center = true);
        }
      }
    }
    cube([40.0, 20.0, 40.0], center = true);
    translate([0.0, 0.6, 0.0])
      rotate([0.0, 90.0, 0.0])
      cylinder(d = 6.4, h = 80.0, $fn = 200, center = true);
  }
}

module rev3()
{
  difference()
  {
    union()
    {
      cube([52.0, 19.9, 52.0], center = true);
      for (i = [0:3])
      {
        hull()
        {
          rotate([0.0, i * 90.0, 0.0])
            translate([23.0, -0.05, 23.0])
            cube([6.0, 20.0, 6.0], center = true);
          rotate([0.0, i * 90.0, 0.0])
            translate([70.0, 0.0, 70.0])
            cube([6.0, 20.0, 6.0], center = true);
        }
      }
    }
    cube([40.0, 20.0, 40.0], center = true);
    translate([0.0, 0.6, 0.0])
      rotate([0.0, 90.0, 0.0])
      cylinder(d = 6.4, h = 80.0, $fn = 200, center = true);
  }
}


module main()
{
  union()
  {
    extruded_form();
    // comment out rev to use
    //rev1();
    //rev2();
    rev3();
  }
}

main();
