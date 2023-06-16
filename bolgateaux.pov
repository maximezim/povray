#version 3.7;

#include "colors.inc"
#include "glass.inc"
#include "woods.inc"
#include "rad_def.inc"

global_settings {
  assumed_gamma 1.8
  max_trace_level 50
  radiosity {
    Rad_Settings(Radiosity_IndoorLQ, no, no )
  }
}

// camera
camera {
  location <-20, 20, -20>
  look_at <0, 5, 0>
  // location <310, 140, 550>
  // look_at <450, 100, 550>
  right x*image_width/image_height
  up y
  angle 90
}

// light
light_source {
    <0,280,0> color rgb<0.9,0.9,0.8>*0.6
}

light_source {
    <0,1,0> color rgb<0.9,0.9,0.8>*0.6
}

plane {
    x, 100 
    pigment { checker rgb<0.8,0.8,0.8>, rgb<0.9,0.9,0.9> scale 10}    
}
plane {
    z, 100 
    pigment { checker rgb<0.8,0.8,0.8>, rgb<0.9,0.9,0.9> scale 10}    
}
plane {
    y, 0 
    pigment { checker rgb<0.8,0.8,0.8>, rgb<0.9,0.9,0.9> scale 10}    
}

// bol
sor {
    5,
    <2, 0>
    <2,2>
    <4,4>
    <5,6>
    <5.5,9>
    pigment { 
        color Blue
    }
    scale 2
}
