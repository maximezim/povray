#version 3.7

#include "colors.inc"
#include "functions.inc"
#include "textures.inc"
#include "metals.inc"

camera {
  location  <0.0, 50,  100.0>
  direction 1.5*z
  right     x*image_width/image_height
  look_at   <0.0, 50,  0.0>
}
#declare Light=light_source {<0,0,0>
    color rgb<1,0.8,0.6>*15
        area_light x,y 8, 8 jitter adaptive 1
    fade_distance 3
    fade_power 20
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

#declare Bulb=sphere{0,1
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
    scale 1
}

union {object{Bulb
    translate <0,50,0>
    texture{T_Shade_On}
    scale 0.5
}
}