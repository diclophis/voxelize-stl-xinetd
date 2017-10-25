include <text_on.scad>;

translate([0, -4, 0]) {
  text_on_sphere(msg, font="Fart", r=38, extrusion_height=2, northsouth=90, size=16, rounded=true, spacing=0.9999);
}

