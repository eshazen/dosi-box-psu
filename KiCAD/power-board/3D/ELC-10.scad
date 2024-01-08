//
// Acopian DC/DC ELC-10 case
//
$fn = 32;
e = 0.1;

function mm(x) = x*25.4;

pin_len = mm(0.25);
pin_dia = mm(0.04);

hole_dia = mm(0.15);
hole_hgt = mm(0.375);

case_wid = mm(3.53);
case_len = mm(2.53);
case_hgt = mm(1.04);

p1_x = case_wid-mm(0.31+2.7);
p1_y = mm(1.07);
p2_y = p1_y+mm(0.7);

module pin_at( x, y) {
  translate( [x, y, -pin_len])
    cylinder( d=pin_dia, h=pin_len);
}

module hole_at( x, y) {
  translate( [x, y, -e])
    cylinder( d=hole_dia, h=hole_hgt+e);
}

module bv() {
  color("grey")
  difference() {
    cube( [case_wid, case_len, case_hgt]);
    translate( [mm(0.165), mm(0.165), 0]) {
      hole_at( 0, 0);
      hole_at( mm(3.2), 0);
      hole_at( mm(3.2), mm(2.2));
      hole_at( 0, mm(2.2));
    }
  }
  pin_at( p1_x, p1_y);
  pin_at( p1_x, p2_y);
  pin_at( p1_x+mm(2.7), p2_y);
  pin_at( p1_x+mm(2.7), p2_y-mm(0.5));
  pin_at( p1_x+mm(2.7), p2_y-mm(1));
}


bv();
