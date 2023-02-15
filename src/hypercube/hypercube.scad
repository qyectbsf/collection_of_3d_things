outer_cube_length = 42.0;
outer_cube_intersection = 30.0;

inner_cube_length = 13.0;

edge_width = 5.0;
edge_length = 72.0; // sqrt( (sqrt(42^2 + 42^2))^2 + 42^2 )

oversize = 0.1;
resolution = 200.0;

space_between_support_and_part = 0.2;

module support()
{
  for (i = [0:3])
  {
    // create basic tree style support
    translate([0,0,-outer_cube_length / 2.0]) hull()
    {
      // lower part
      rotate([0,0,i * 90])
        translate([26, 0, 3 + space_between_support_and_part])
        cube([3,30,6], center = true);

      // upper part
      rotate([0,0,i * 90])
        translate([18,0,34.5])
        cube([6,23,3], center = true);
    }
  }

  translate([0,0, -outer_cube_length / 2.0 + (outer_cube_length - inner_cube_length) / 4.0 + space_between_support_and_part])
    cube([inner_cube_length, inner_cube_length, (outer_cube_length - inner_cube_length) / 2.0], center = true);
}


module main()
{
  // create the outer cube with intersection
  difference()
  {
    cube(outer_cube_length, center = true);

    union()
    {
      cube([outer_cube_intersection,
            outer_cube_intersection,
            outer_cube_length + oversize], center = true);
      cube([outer_cube_intersection,
            outer_cube_length + oversize,
            outer_cube_intersection], center = true);
      cube([outer_cube_length + oversize,
            outer_cube_intersection,
            outer_cube_intersection], center = true);
    }
  }

  // create inner cube
  cube(inner_cube_length, center = true);

  // create inner edge structure
  intersection()
  {
    cube(outer_cube_length, center = true);

    union()
    {
      for (i = [0:3])
      {
        rotate([55,0,45 + i * 90])
          cylinder(h = 72, d = edge_width, center = true, $fn = resolution);
      }
    }
  }
}

// uncomment to export support
/* difference() */
/* { */
/*   support(); */
/*   main(); */
/* } */

// uncomment to export hypercube
main();

