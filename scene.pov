#version 3.7;

#include "colors.inc"
#include "objets.inc"
#include "textures.inc"
#include "glass.inc"
#include "woods.inc"
#include "lamp.inc"

// camera
camera {
  location <250, 200, 350>
  look_at <500, 100, 700>
  right x*image_width/image_height
  up y
  angle 90
}

// light
light_source {
    <250,280,350> White * 1.0
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

object { Carpet translate <200, 1, 400> }
