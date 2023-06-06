#version 3.7;

#include "colors.inc"
#include "objets.inc"
#include "textures.inc"
#include "glass.inc"
#include "woods.inc"
#include "rad_def.inc"

global_settings {
  assumed_gamma 1.0
  radiosity {
    Rad_Settings(Radiosity_IndoorLQ, no, no )
  }
}

// camera
camera {
  location <150, 180, 350>
  look_at <430, 100, 700>
  // location <200, 160, 400>
  // look_at <450, 100, 400>
  right x*image_width/image_height
  up y
  angle 90
}

// light
light_source {
    <250,280,350> color rgb<0.9,0.9,0.8>
}

plane {
  y, 295
  pigment { color White }
  finish {
    ambient 0.2
    specular 0.2
    reflection 0.1
    roughness 0.01
  }
  normal {
    bumps 0.2
    scale 0.5
    octaves 6
    turbulence 0.5
  }
  
}

object {
  Room
  texture { beige_wall }
}

object {
  Sol 
  texture { planche }
}

object {
  sofa 
  texture { sofa_texture }
  rotate <0, 0, 0>
  translate <0, 0, 380>
}
union {
  object {plinthes pigment {color rgb<0.63,0.53,0.5>} translate <0, 0, 705>}
  object {plinthes pigment {color rgb<0.63,0.53,0.5>} rotate <0, 90, 0> translate <505, 0, 705>}
}

object { Carpet translate <90, 1, 410>
  scale <2, 1, 1>
}

// 4 obejcts pied table + a box on top
union {
  object { piedtable texture {woodtable} translate <300, 0, 450>}
  object { piedtable texture {woodtable} translate <300, 0, 600>}
  object { piedtable texture {woodtable} translate <400, 0, 450>}
  object { piedtable texture {woodtable} translate <400, 0, 600>}
  box { <290, 60, 440>, <410, 65, 610> texture {woodtable} }
  translate <-70, 0, 20>
}

object {
  meubletv texture {meubletele} rotate <90, 0, 90> translate <350, 70, 410>
  // rajouter pieds ou coller contre le mur
}

// object {
//  ecran translate <250, 100, 410>
// }