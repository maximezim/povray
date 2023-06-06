#version 3.7;

#include "colors.inc"
#include "objets.inc"
#include "textures.inc"
#include "glass.inc"
#include "woods.inc"

// camera
camera {
  location <200, 180, 250>
  look_at <400, 100, 700>
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

object { Carpet translate <90, 1, 410>
  scale <2, 1, 1>
}

// 4 obejcts pied table + a box on top
union {
  object { piedtable texture {woodtable} translate <300, 0, 450>}
  object { piedtable texture {woodtable} translate <300, 0, 600>}
  object { piedtable texture {woodtable} translate <400, 0, 450>}
  object { piedtable texture {woodtable} translate <400, 0, 600>}
  box { <290, 60, 440>, <410, 70, 610> texture {woodtable} }
  translate <-70, 0, 20>
}
