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


// use room object from objects.inc with parquet texture from textures.inc
object {
  Room
  texture { murs } // Applying the "parquet" texture to the "Room" object
}

object {
  Sol 
  texture { planche }
}


