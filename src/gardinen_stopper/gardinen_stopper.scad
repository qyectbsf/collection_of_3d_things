translate([0,0,0.9]) cube([10,8,1.8], center = true);

for (i = [1,-1])
{
  translate([i * 4,0,0]) rotate([0,i * 4,0]) translate([0,0,9]) difference()
  {
    union()
    {
      cube([2,8,17], center = true);
      translate([i * 1.2,0,7.5]) cube([4.2,8,2], center = true);
    }
    translate([i * 0.7,0,1]) cube([0.6,8,2], center = true);
  }
}