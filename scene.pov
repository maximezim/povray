#version 3.7;

#include "colors.inc"
#include "objets.inc"
#include "textures.inc"
#include "glass.inc"
#include "woods.inc"

// camera
camera {
  location <10, 100, 10>
  look_at <100, 100, 100>
  right x*image_width/image_height
  up y
  angle 100
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