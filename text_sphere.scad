include <text_on.scad>;

translate([0, 64, 0]) {
  text_on_sphere(msg, font="Times New Roman", r=128, extrusion_height=4, northsouth=90, size=24,rounded=true);
}

