#version 3.7;

#include "colors.inc"
#include "objets.inc"
#include "textures.inc"
#include "glass.inc"
#include "woods.inc"
#include "rad_def.inc"
#include "lampesalon.inc"

global_settings {
  assumed_gamma 1.8
  max_trace_level 50
  radiosity {
    Rad_Settings(Radiosity_IndoorLQ, no, no )
  }
}

// camera
camera {
  location <170, 140, 450>
  look_at <430, 100, 650>
  // location <310, 140, 550>
  // look_at <450, 100, 550>
  right x*image_width/image_height
  up y
  angle 90
}

// light
// light_source {
//     <250,280,350> color rgb<0.9,0.9,0.8>*0.6
// }

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
    canette 
    scale <4,4,4>
    translate<250,65,490>   
}

object{
    plateau_saucisson
    scale<1.5,1.5,1.5>
    rotate<0,58,0>
    translate<165,13,600>
}

object{
    verre
    scale<2,2,2>
    translate<260,65,610>
}

object{
    verre2
    scale<2,2,2>
    translate<240,65,510>
}


object{
    tv
    rotate<0,90,0>
    translate<410, 90, 600>
        
}

object {
  meubletv texture {meubletele} rotate <90, 0, 90> translate <400, 30, 490>
  // rajouter pieds ou coller contre le mur
}

object {
  livres translate <430, 33, 500> 
}

object{
    manette
    scale<1,1.3,1>
    rotate<0,120,0>
    translate<310,15.5,530>
}

object{
    manette
    scale<1,1.3,1>
    rotate<0,70,0>
    translate<280,15.5,640>
}

object{
    miroir
    scale<8,8,8>
    rotate<0,90,0>
    translate<200,60,700>
    
}

object {
  Lamptot scale 8 translate <440, -8*0.7, 440> 
}

object {
  bolChips translate <300, 61, 530>
}

object {
  projecteur rotate<-90,0,180> translate <240, 270, 700>
}
