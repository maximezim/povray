#version 3.7

#include "colors.inc"
#include "functions.inc"

plane{
    y, 0
    pigment{checker color Red color Yellow scale 3}
}

plane{
    z, 10
    pigment{color White * 0.4}
}

camera{
    location <0, 3, -10>
    look_at <0, 0, 0>
}

light_source{
    <0, 2, -5>
    color White * 1
}

#declare offwhitepaint = texture { pigment { color rgb <0.9 0.9 0.8> } finish { specular 0 reflection 0 diffuse 0.7 } }
#declare blackrubber = texture { pigment { color rgb <0.2 0.2 0.2> * 0.1 } finish { specular 0 reflection 0 diffuse 0.7 } }
#declare blackplastic = texture { pigment { color rgb <0.1 0.1 0.1> * 0.1 } finish { specular 0.05 reflection 0 diffuse 0.4 } }

//coffee cup
#declare bolt_cup =
union {
  //cup
  difference {
    cylinder { <0,0.6,0> <0,3.75,0> 1.625 }
    cylinder { <0,0.9,0> <0,3.8,0> 1.375 }
    cone { <0,3,0> 1.3 <0,3.8,0> 1.5 }
    //round the transition between cone and cylinder
    #declare trans_rad=1;
    //intersection of cone and cylinder above occurs at y=3.3
    difference {
      cylinder { <0,0,0> <0,0.2443*trans_rad,0> 1.375+trans_rad }
      torus { 1.375+trans_rad trans_rad }
      translate (3.3-trans_rad*0.12309)*y
    }
  }
  torus { 1.585 0.04 translate <0,3.75,0> }
  torus { 1.535 0.04 translate <0,3.75,0> }
  torus { 1.585 0.04 translate <0,0.6,0> }
  //handle
  //top nut
  intersection {
    sphere { <0,-0.20,0> 0.4 }
    prism {
      linear_sweep linear_spline -0.1,0.25,7,
      <-0.216,0.125> <0,0.25> <0.216,0.125>
      <0.216,-0.125> <0,-0.25> <-0.216,-0.125> <-0.216,0.125>
    }
    scale 1.2
    rotate -90*z
    translate <1.625,3.25,0>
  }
  //top of u-bolt
  cylinder { <1.625,3.25,0> <2.125,3.25,0> 0.1875 }
  difference {
    torus { 0.5 0.1875 rotate 90*x }
    box { <-2,-2,-2> <2,0,2> }
    box { <-2,-2,-2> <0,2,2> }
    translate <2.125,2.75,0>
  }
  cylinder { <2.625,1.75,0> <2.625,2.75,0> 0.1875 }
  difference {
    torus { 0.5 0.1875 rotate 90*x }
    box { <-2,2,-2> <2,0,2> }
    box { <-2,-2,-2> <0,2,2> }
    translate <2.125,1.75,0>
  }
  //bottom of u-bolt
  cylinder { <1.625,1.25,0> <2.125,1.25,0> 0.1875 }
  //bottom nut
  intersection {
    sphere { <0,-0.20,0> 0.4 }
    prism {
      linear_sweep linear_spline -0.1,0.25,7,
      <-0.216,0.125> <0,0.25> <0.216,0.125>
      <0.216,-0.125> <0,-0.25> <-0.216,-0.125> <-0.216,0.125>
    }
    scale 1.2
    rotate -90*z
    translate <1.625,1.25,0>
  }


  //base (on real cup, this is a rubber cap that covers the bottom)
  cone { <0,0,0> 1.45 <0,0.65,0> 1.55 }
  #local i=0;
  #while (i<7)
    torus { 1.5+i*0.01 0.04 translate (0.05+0.08*i)*y texture { blackrubber } }
    #local i=i+1;
  #end
  texture { blackplastic }
}

object { bolt_cup}