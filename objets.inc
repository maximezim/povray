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