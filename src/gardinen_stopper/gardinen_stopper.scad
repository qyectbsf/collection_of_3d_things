translate([0.0, 0.0, 0.9]) cube([10.0, 8.0, 1.8], center = true);

for (i = [-1.0, 1.0])
{
  translate([i * 4.0, 0.0, 0.0])
    rotate([0.0, i * 4.0, 0.0])
    translate([0.0, 0.0, 9.0])
    difference()
  {
    union()
    {
      cube([2.0, 8.0, 17.0], center = true);
      translate([i * 1.2, 0.0, 7.5])
        cube([4.2, 8.0, 2.0], center = true);
    }
    translate([i * 0.7, 0.0, 1.0])
      cube([0.6, 8.0, 2.0], center = true);
  }
}
