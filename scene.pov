#version 3.7;

#include "colors.inc"
#include "objets.inc"
#include "textures.inc"
#include "glass.inc"
#include "woods.inc"
#include "lamp.inc"

// camera
camera {
  location <400, 100, 600>
  look_at <0, 100, 0>
  right x*image_width/image_height
  up y
  angle 110
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

object {plinthes pigment {color Blue}}

object { Carpet translate <200, 1, 400> }