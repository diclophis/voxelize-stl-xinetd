include <text_on.scad>;

rotate([0, sp, 0]) {
  text_on_sphere(msg, font="Times New Roman", r=100, extrusion_height=5, northsouth=ns, eastwest=ew, size=28, rounded=false);
}
