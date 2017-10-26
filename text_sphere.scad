include <text_on.scad>;

translate([0, 0, 0]) {
  rotate([0, -45, 0]) {
    rotate([-33, 0, -33]) {
      rotate([0, 0, 33]) {
        rotate([0, -33, 0]) {
          rotate([0, 0, -6]) {
            text_on_sphere(msg, font="TakaoMincho", r=300, extrusion_height=3, northsouth=90, size=32, rounded=true, spacing=1.01);
          }
        }
      }
    }
  }
}

