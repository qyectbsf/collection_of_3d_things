oversize = 0.1;
resolution = 200.0;


module cat_cable(width, length, cable_width)
{
  difference()
  {
    // main structure
    hull()
    {
      cube([width, length, 2.0], center = true);
      translate([0.0, 0.0, 4.4])
        cube([10.0, length, 2.0], center = true);
    }

    // cutout for cable
    translate([0.0, 0.0, 4.0])
      rotate([90.0, 0.0, 0.0])
      cylinder(h = length + oversize, d = cable_width, $fn = resolution, center = true);
  }
}

module cat_5e(width, length)
{
  cat_cable(width = width, length = length, cable_width = 5.48);
}

module main()
{
  cat_5e(width = 20.0, length = 40.0);
}

main();
