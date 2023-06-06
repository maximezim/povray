// CURTAIN sample file
// GEMELLI David
// 26/01/1999

#include "colors.inc"

camera {
     location <30, -7, 10>
     sky <0, 1, 0>
     look_at <0, -12, 10>
}

light_source {
     <100, 20, 50>
     White
}

#declare NbMax = 5; // nb ondulations
#declare Coef1 = 2; // taille maxi en X
#declare Step = 1;  // pas maxi entre deux ondulations
#declare Rings = 1; // ajoute des anneaux
#declare Tex_Rings = texture {pigment {color Sienna}}
#declare Tex_Curtain = texture {pigment {rgbt<1, 1, 1, 0.5>}}
#declare CURTAIN_FLATNESS = 0.1; // bicubic_patch flatness
#include "curtain.inc"

union {
     object {Curtain}
     cylinder {
          <0, Rod_Y, -1>, <0, Rod_Y, Rod_Min_Z + 5>, Rod_Radius
     }
     sphere {<0, Rod_Y, -1>, 3 * Rod_Radius}
     sphere {<0, Rod_Y, Rod_Min_Z + 5>, 3 * Rod_Radius}
     pigment {color Sienna}
}

sky_sphere {
     pigment {color Blue}
}
