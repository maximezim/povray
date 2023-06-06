#include "functions.inc"

#declare Room = box { <0, 0, 0>, <500, 300, 700> }

#declare Sol = plane { y, 1 }

#declare sofa = union {
  box { <0, 0, 0>, <100, 70, 80> }
  box { <0, 0, 80>, <100, 70, 160> }
  box { <0, 0, 160>, <100, 70, 240> }
  box { <0, 0, 240>, <100, 70, 320> }
}

#declare plinthes = union {
  lathe { 
    linear_spline 
    5,
    <0, 0>, <0, 10>, <10, 10>, <10, 0>, <0, 0>
    scale <100, 1, 1>
  }
}

#declare Carpet = box { 
  <0, 0, 0>, <100, 1, 250>
  texture { 
    pigment { 
      marble color_map { 
        [0.0 rgb <0.5,0,0>]
        [0.5 rgb <1,0,0>]
        [0.6 rgb <0.8,0,0>]
        [1.0 rgb <0.5,0,0>]
      }
      turbulence 0.15
      scale 10
    }
    finish { ambient 0.3 diffuse 0.6 reflection 0.01 }
    normal { quilted 1 control0 0.5 control1 0.9 scale 0.24 turbulence 1 }
  }
}

#declare piedtable = union{
  lathe {
    linear_spline
    21,
    <1, 0.5>,
    <1, 3>,
    <1, 4>,
    <1, 5>,
    <1, 6>,
    <1, 7>,
    <1, 8>,
    <1, 9>,
    <1, 10>,
    <1.05, 10.5>,
    <1.1, 11>,
    <1.12, 11.2>,
    <1.14, 11.4>,
    <1.16, 11.6>,
    <1.18, 11.8>,
    <1.2, 12>,
    <1.05, 12.3>,
    <0.9, 12.6>,
    <0.8, 13>,
    <2, 14>,
    <2.5, 15>
    }
    scale 4
}

#declare meubletv = 
difference {
  prism {
    cubic_spline
    0, 100, 
    8,
    <0, 0>, <0, 50>, <50, 50>, <50, 0>, <0, 0>, <0, 50>, <50, 50>, <3, 0>
  }
  box { <5, 3, -10>, <45, 97, 45> }
}

// #declare ecran = 
// on veut faire un ecran qui emet de la lumière
// avec une image transparente dessus
// et un cadre noir autour


