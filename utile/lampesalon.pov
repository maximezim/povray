#version 3.7;

#include "colors.inc"
#include "glass.inc"
#include "woods.inc"
#include "metals.inc"
#include "rad_def.inc"
#include "functions.inc"
// #include "utile/lamp.inc"

global_settings {
  assumed_gamma 1.8
  max_trace_level 20
//   radiosity {
//     Rad_Settings(Radiosity_IndoorLQ, no, no )
//   }
}

// camera
camera {
  location <-10, 10, -10>
  look_at <0, 10, 0>
  // location <310, 140, 550>
  // look_at <450, 100, 550>
  right x*image_width/image_height
  up y
  angle 90
}

plane{y,0 pigment{color Blue} finish{ambient 0.2 diffuse 0.8}}
plane{x,1000 pigment{color Blue} finish{ambient 0.2 diffuse 0.8}}
plane{z,1000 pigment{color Blue} finish{ambient 0.2 diffuse 0.8}}

// light
light_source {
    <0,280,0> color rgb<0.9,0.9,0.8>*0.6
}

#declare Light=light_source {<0,0,0>
    color rgb<1,0.8,0.6>*15
        area_light x,y 80, 80 jitter adaptive 1
    fade_distance 3
    fade_power 2
}

#declare pied=cylinder{0,y*0.1,1.5}

#declare ColumnLamp=cylinder{0,y*8,0.2}

#local DecoLeaves=intersection{
        difference{sphere{0,1} sphere{0,0.99}}
        plane{z,0 rotate y*20 inverse}        
        plane{z,0 rotate -y*20}        
        translate <-1,0.7,0> rotate z*20
}                   
#local RingLeaves=union{  
        #local teta=0;                                        
        #while (teta<360)
                object{DecoLeaves rotate z*50 translate -x*0.8 rotate y*teta}
                #local teta=teta+36;
        #end
        scale <0.6,0.6,0.6>*0.8
}                
                            
#declare JointLampBottom=union{
        object{RingLeaves scale <0.8,1,0.8> translate y*0.5}
        torus{0.4,0.1}
        sphere{0,0.41}
        cylinder{0,7*y,3.1 scale 1/10}
}

#declare T_Shade_On=texture{
    pigment{
        bozo turbulence 0.6
        color_map{
           [0 rgbf<1,0.8,0,0.3>]
           [1 rgbf<1,0.8,0,0.7>]
        }
    }
    finish{ambient 0 diffuse 0.8 specular 0.05 roughness 0.01}
}

#declare T_Iron=texture{
    pigment{rgb <0.8,0.8,0.9>*0.5} 
    normal{agate bump_size 0.3 scale 0.01}
    finish{metallic brilliance 3 ambient 0 diffuse 1 specular 1 roughness 0.05
        reflection{0,0.2}
    }
}
#declare T_Douille=texture{T_Brass_3A finish{ambient 0}}

#declare Bulb=sphere{0,6
    hollow
    texture{pigment{Clear}finish{ambient 0 diffuse 0}}
    interior{
        media{     
            emission White*10
            density{
                spherical
                poly_wave 5
                color_map{
                    [0 color Black]
                    [0.1 color White]
                }       
            }
            
        }
    }                         
    scale 0.1
}

#declare rShadeDown=2.7*0.7;
#declare rShadeUp=1.5*0.7;
#declare yShade=2.3;
#declare rShadeRim=0.05;
#declare eShade=rShadeRim;
#declare Shade_On=union{
    difference{
        cone{0,rShadeDown,y*yShade,rShadeUp}
        cone{-0.01*y,rShadeDown-eShade,y*(yShade+0.01),rShadeUp-eShade}
        texture{T_Shade_On scale 0.5}
        interior{
            media{
                scattering {10,20}
            }
        }
        hollow
    }                       
    union{
        torus{rShadeDown,rShadeRim}
        torus{rShadeUp,rShadeRim translate y*yShade}
        #declare i=0;
        #while (i<4)
            cylinder{-z*rShadeDown,y*yShade/10,rShadeRim rotate y*360*i/4}
            #declare i=i+1;
        #end
        texture{T_Brass_2A}
//                no_shadow
    }
//    rotate -z*3
}    

#declare Lamptot = union{
    object{pied translate y*0.8}
    object{ColumnLamp scale <0.8,1,0.8> translate y*0.8} 
    union{
        object{JointLampBottom translate y*8.5}
    }
    union{
            object{Light translate y*1.6}
            object{Bulb translate y*0.8}
            object{Shade_On}
            translate y*9
        }
    texture{T_Iron}
    scale 1.5
}


object{Lamptot}
