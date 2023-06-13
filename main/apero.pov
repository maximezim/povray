#include "functions.inc"
#include "shapes3.inc"
#include "textures.inc"
#include "metals.inc"
#include "woods.inc"

#declare Room = box { <0, 0, 0>, <500, 300, 700> }

#declare Sol = plane { y, 1 }

#declare sofa = union {
  box { <0, 0, 0>, <100, 70, 80> }
  box { <0, 0, 80>, <100, 70, 160> }
  box { <0, 0, 160>, <100, 70, 240> }
  box { <0, 0, 240>, <100, 70, 320> }
}

#declare plinthes = union {
  lathe { 
    linear_spline 
    5,
    <0, 0>, <0, 10>, <10, 10>, <10, 0>, <0, 0>
    scale <100, 1, 1>
  }
}

#declare Carpet = box { 
  <0, 0, 0>, <100, 1, 250>
  texture { 
    pigment { 
      marble color_map { 
        [0.0 rgb <0.5,0,0>]
        [0.5 rgb <1,0,0>]
        [0.6 rgb <0.8,0,0>]
        [1.0 rgb <0.5,0,0>]
      }
      turbulence 0.15
      scale 10
    }
    finish { ambient 0.3 diffuse 0.6 reflection 0.01 }
    normal { quilted 1 control0 0.5 control1 0.9 scale 0.24 turbulence 1 }
  }
}

#declare piedtable = union{
  lathe {
    linear_spline
    21,
    <1, 0.5>,
    <1, 3>,
    <1, 4>,
    <1, 5>,
    <1, 6>,
    <1, 7>,
    <1, 8>,
    <1, 9>,
    <1, 10>,
    <1.05, 10.5>,
    <1.1, 11>,
    <1.12, 11.2>,
    <1.14, 11.4>,
    <1.16, 11.6>,
    <1.18, 11.8>,
    <1.2, 12>,
    <1.05, 12.3>,
    <0.9, 12.6>,
    <0.8, 13>,
    <2, 14>,
    <2.5, 15>
    }
    scale 4
}

#declare meubletv = 
difference {
  prism {
    cubic_spline
    0, 100, 
    8,
    <0, 0>, <0, 50>, <50, 50>, <50, 0>, <0, 0>, <0, 50>, <50, 50>, <3, 0>
  }
  box { <5, 3, -10>, <45, 97, 45> }
}





#declare forme_upercule3 = object{ 
    Round_Conic_Prism(0.95,0.80,0.50,0.50,0.10,0) 
    texture { T_Chrome_3A finish { phong 1 }} 
    scale<0.7,0.7,0.7>  rotate<90,180,0>  translate<0,5.25,0.5>
}

#declare can = union{
    object { 
         Round_Cylinder(<0,0,0>, <0,5,0>,1.3,0.35,0)  
         pigment {image_map {"coke.jpg" map_type 2} scale<1,5,1>}
         scale<1,1,1>  rotate<0, 0,0> 
    } 
    cone { 
        <0,0,0>,0.95,<0,0.55,0>, 1.24 
        open
        texture { pigment{ color rgb<0.48,0,0> } finish { phong 0.4 reflection{ 0.00 metallic 0.00}}} 
        scale <1,1,1> rotate<180,0,0> translate<0,5.40,0>         
    }
    difference {
        object{ 
            Segment_of_CylinderRing(0.97,0.0,0.10,360) 
            texture { T_Chrome_3A finish {phong 1 ambient 0.8}} 
            scale <1,1,1> rotate<0,0,0> translate<0,5.2,0>
        }
        object{forme_upercule3}
    }
    object{ Segment_of_CylinderRing(0.97,0.93,0.10,360)
            texture { T_Chrome_3A finish { phong 1}} 
            scale <1,1,1> rotate<0,0,0> translate<0,5.3,0>
    } 
    object{ Segment_of_CylinderRing(1,0.97,0.13,360)
        texture { T_Chrome_3A finish {phong 1}}
        scale <1,1,1> rotate<0,0,0> translate<0,5.4,0>
      } 
}

#declare forme_upercule = intersection{
        box { <-0.5,-0.05, -0.8>, <0.5, 0.05, 0.8> 
            texture { T_Chrome_3A finish {phong 1 ambient 0.8}} 
            rotate<0,0,0> scale 0.5 translate<0,0,0>
        }  
        sphere { <0,0,0>, 0.36 
            texture { T_Chrome_3A finish {phong 1}}
            scale<0.8,1,1>  rotate<0,0,0>  translate<0,0,0>  
       } 
} 

#declare forme_upercule2 = intersection{
       box { 
            <-0.5,-0.05, -0.8>, <0.5, 0.05, 0.8> 
            texture { T_Chrome_3A finish {phong 1}} 
            rotate<0,0,0> scale 0.5 translate<0,0,0>
       }    
        sphere {
            <0,0,0>, 0.36 
            texture { T_Chrome_3A finish {phong 0.5}} 
            scale<0.7,1,1>  rotate<0,0,0>  translate<0,0,0>  
       }  
} 

#declare upercule = difference{
    object{forme_upercule}
    object{forme_upercule2 rotate<0,90,0> scale <0.45,2,0.5> translate<0,0,0.17>}
    translate<0,4.25,0.3>
}

#declare canette = union {
    object{can scale<1,0.8,1>}
    object{upercule}
}


#declare planche = union{
    object{
        Round_Box(<0,0,0>,<30,2,20>,1,0)  
        texture{ T_Wood1     
            normal { wood 0.5 scale 0.05}
            finish { phong 1 } 
            rotate<0,0, 0> scale 20
        }
        scale<1,1,1>  rotate<0, 0,0> translate<50,35,20>
    }
    object{ 
        Round_Box(<0,0,0>,<12,1,4>,1,0)  
        texture{ T_Wood1     
            normal { wood 0.5 scale 0.05}
            finish { phong 1 } 
            rotate<0,0, 0> scale 20
        }
        scale<1,1,1>  rotate<0, 0,0> translate<78,35.5,28>
    }
}        
         
#declare bout_saucisson = intersection{        
    box { <-1, 0, -1>,< 1, 0.2, 1>   
        pigment
        {image_map
           {"saucisson.jpg" map_type 1}
         scale<1,1,1>
        } 
        scale <2,1,2> rotate<0,0,0> translate<0,1,0> 
    }
    sphere { <0,0,0>, 1.5 
        pigment
        {image_map
            {"saucisson.jpg"map_type 1}
         scale<3,3,3>
        } 
        scale<1,1,1>  rotate<0,0,0>  translate<0,1,0>  
    } 
}

#declare saucisson = union{ 
    object{
        bout_saucisson
        scale<1,30,1>
        rotate<-30,0,90>
        translate<100,38.5,49>   
    }
    object{
        bout_saucisson
        rotate<-29,0,78>
        translate<69.4,38.3,31>
    }
    object{
        bout_saucisson
        rotate<-29,0,72>
        translate<68.9,38.2,30.8>
    }
    object{
        bout_saucisson
        rotate<-29,0,70>
        translate<68.5,38.2,30.4>
    }  
    object{
        bout_saucisson
        translate<64,36,28>
    }  
    object{
        bout_saucisson
        rotate<-7,0,0>
        translate<63,36.2,26>
    }
    object{
        bout_saucisson
        rotate<14,0,0>
        translate<62.5,36.3,28>
    }
}  

#declare couteau = union{
    intersection{
        box { <-1, 0, -1>,< 1, 0.2, 1>   
            texture { T_Chrome_3A finish { phong 1 ambient 0.7}} 
            scale <1,1,1> rotate<0,0,0> translate<0,1,0> 
        } 
        sphere { <0,0,0>, 1 
            texture { T_Chrome_3A finish {phong 1}} 
            scale<1,1,2>  rotate<0,0,0>  translate<1,1,-1>  
        }
        scale<1,0.5,2>   
    }  
    box { <0, 0, 0>,< 1, 0.2, 3>   
        texture {T_Wood2
        finish {phong 1}} 
        scale <1,1,1> rotate<0,0,0> translate<0,0.45,-5> 
    }   
} 

#declare plateau_saucisson = union {
    object{
        couteau
        scale<1.5,2,2>
        rotate<0,90,11>
        translate<50,36,30>
    }  
    object{
        saucisson
    }
    object{
        planche
    }
} 

#declare verre = union {
    difference{
        cylinder { <0,0,0>,<0,6.00,0>, 3
                pigment { White filter 1 }
                 finish {
                    ambient .1
                    diffuse .1
                    reflection .2
                    specular 1
                    roughness 0.0001
                 }
                 interior{
                    ior 1.1
                    fade_distance 1
                    fade_power 1
                    caustics 1
                 }
               scale <1,1,1> rotate<0,0,0>  translate<0,0,0>
             }
         cylinder { <0,0,0>,<0,5,0>, 2.7
                open
                pigment { White filter 1 }
                
                 finish {
                    ambient .1
                    diffuse .1
                    reflection .2
                    specular 1
                    roughness 0.0001
                 }
                 interior{
                    ior 1.1
                    fade_distance 1
                    fade_power 1
                    caustics 1
                 }
    
               scale <1,1,1> rotate<0,0,0>  translate<0,1,0>
             }                
       } 
       cylinder { <0,0,0>,<0,3,0>, 2.5
           pigment { color rgbt<0.663,0.251,0.027,0.1>}
            
            interior{
                    ior 1.5
                 }
    
           scale <1,1,1> rotate<0,0,0>  translate<0,1.1,0>
         }
         
       object{ 
        Round_Box(<0,0,0>,<1.6,1.6,1.6>, 0.3   , 0)  
         
        texture{ pigment{ color rgbt<1,1,1,0.9>}
         
                 finish { phong 0.2 }
                }
        scale<1,1,1>  rotate<50, 10,10> translate<0,3.5,0>
      }
      
      object{ 
        Round_Box(<0,0,0>,<1.5,1.5,1.5>, 0.3   , 0)  
         
        texture{ pigment{ color rgbt<1,1,1,0.9>}
               
                 finish { phong 0.2 }
                }
        scale<1,1,1>  rotate<-30, 80,10> translate<-1,2.5,0>
      }    
         
  }
  
#declare verre2 = union {
    difference{
        cylinder { <0,0,0>,<0,6.00,0>, 3
                pigment { White filter 1 }
                 finish {
                    ambient .1
                    diffuse .1
                    reflection .2
                    specular 1
                    roughness 0.0001
                 }
                 interior{
                    ior 1.1
                    fade_distance 1
                    fade_power 1
                    caustics 1
                 }
               scale <1,1,1> rotate<0,0,0>  translate<0,0,0>
             }
         cylinder { <0,0,0>,<0,5,0>, 2.7
                open
                pigment { White filter 1 }
                
                 finish {
                    ambient .1
                    diffuse .1
                    reflection .2
                    specular 1
                    roughness 0.0001
                 }
                 interior{
                    ior 1.1
                    fade_distance 1
                    fade_power 1
                    caustics 1
                 }
    
               scale <1,1,1> rotate<0,0,0>  translate<0,1,0>
             }                
       } 
       cylinder { <0,0,0>,<0,3,0>, 2.5
          
           pigment { color rgbt<0.2, 0.09, 0.03,0.5>} 
            interior{
                    ior 1.5
                 }
    
           scale <1,1,1> rotate<0,0,0>  translate<0,1.1,0>
         }
         
      object{ // Round_Box(A, B, WireRadius, UseMerge)
        Round_Box(<0,0,0>,<1.6,1.6,1.6>, 0.3   , 0)  
         
        texture{ pigment{ color rgbt<1,1,1,0.9>}
               //normal { radial sine_wave frequency 30 scale 0.25 }
                 finish { phong 0.2 }
                }
        scale<1,1,1>  rotate<50, 10,10> translate<0,4,0>
      }
      
      object{ 
        Round_Box(<0,0,0>,<1.5,1.5,1.5>, 0.3   , 0)  
         
        texture{ pigment{ color rgbt<1,1,1,0.9>}
               
                 finish { phong 0.2 }
                }
        scale<1,1,1>  rotate<-30, 0,10> translate<-1.5,2.5,-1>
      }    

  } 
   








// #declare ecran = 
// on veut faire un ecran qui emet de la lumiÃ¨re
// avec une image transparente dessus
// et un cadre noir autour


