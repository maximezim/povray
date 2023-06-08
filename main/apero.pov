// PoVRay 3.7 Scene File " ... .pov"
// author:  ...
// date:    ...
//--------------------------------------------------------------------------
#version 3.7;
global_settings{ assumed_gamma 1.0 }
#default{ finish{ ambient 0.1 diffuse 0.9 }} 
//--------------------------------------------------------------------------
#include "colors.inc"
#include "textures.inc"
#include "glass.inc"
#include "metals.inc"
#include "golds.inc"
#include "stones.inc"
#include "woods.inc"
#include "shapes.inc"
#include "shapes2.inc"
#include "functions.inc"
#include "math.inc"
#include "transforms.inc"
#include "shapes3.inc"
//--------------------------------------------------------------------------
// camera ------------------------------------------------------------------
#declare Camera_0 = camera {      right x * image_width/image_height
                                  up y         // front view
                                  location  <20 , 23 , 3>
                                  look_at   <20 , 18 , 10>
                           }

camera{Camera_0}
// sun ----------------------------------------------------------------------
light_source{< 2,60,-5> color White}
// sky ----------------------------------------------------------------------
sky_sphere { pigment { gradient <0,1,0>
                       color_map { [0.00 rgb <0.6,0.7,1.0>]
                                   [0.35 rgb <0.1,0.0,0.8>]
                                   [0.65 rgb <0.1,0.0,0.8>]
                                   [1.00 rgb <0.6,0.7,1.0>] 
                                 } 
                       scale 2         
                     } // end of pigment
           } //end of skysphere
// ground -------------------------------------------------------------------
plane{ <0,1,0>, 0 
       texture{ pigment{ checker color rgb<1,1,1>*1.2 color rgb<0.25,0.15,0.1>*0}
              //normal { bumps 0.75 scale 0.025}
                finish { phong 0.1}
              } // end of texture
     } // end of plane
//---------------------------------------------------------------------------
//---------------------------- objects in scene ----------------------------
//---------------------------------------------------------------------------


           
#declare table = union {
    box { <0, 10, 0>, <50, 15, 50> 
        
               texture{ T_Stone3    
                normal { agate 0.25 scale 0.15 rotate<0,0,0> }
                finish { phong 1 } 
                rotate<0,0,0> scale 0.5 translate<0,0,0>
              } // end of texture 


    }   
}           

object{table}

#declare forme_upercule3 = 
object{ Round_Conic_Prism( 0.95, // >0, vertical center distance of the upper and lower torii
                           0.80, // >0, upper radius up by <0,C_distance,0>
                           0.50, // >0,  lower radius on zero !!!
                           0.50, // >0, length in z-
                           0.10, // border radius, // max. = min(lower radius, upper radius)
                           0 // Merge_On
                         ) // ------------------------------------------------  
         texture { T_Chrome_3A
                  finish { phong 1 }
                } // end of texture
          scale<0.7,0.7,0.7>  rotate<90,180,0>  translate<0,5.25,0.5>
       }  // end of object ---------------------------------------------------
//---------------------------------------------------------------------------- 




#declare can = union{

object { //Round_Cylinder(point A, point B, Radius, EdgeRadius, UseMerge)
         Round_Cylinder(<0,0,0>, <0,5,0>, 1.3 ,       0.35,   0)  
         
         pigment
        { image_map
            { "coke.jpg" 
                map_type 2
             }
             scale<1,5,1>
        }
         
         scale<1,1,1>  rotate<0, 0,0> 
       } // ---------------------------------------------------------

cone { <0,0,0>,0.95,<0,0.55,0>, 1.24 
       open
       texture { pigment{ color rgb<0.48,0,0> }
                 //pigment{ color rgb<0.8,1.0,0.25>*0.75}
                 finish { phong 0.4 reflection{ 0.00 metallic 0.00} } 
               } // end of texture

       scale <1,1,1> rotate<180,0,0> translate<0,5.40,0>         
     }
     
     
difference {
     
     //--------------------------------------------------------------------------
    object{ Segment_of_CylinderRing( 0.97, // major radius,
                                     0.0, // minor radius,  
                                     0.10, // height H,
                                     360  // angle (in degrees)  
                                   ) //-----------------------------------------
          
                      texture { T_Chrome_3A
                       //normal { bumps 0.5 scale 0.15} 
                       finish { 
                            phong 1
                            ambient 0.8
      
                                              }
                     } // end of texture 
    
                   
            scale <1,1,1> rotate<0,0,0> translate<0,5.2,0>
          } // end of object

    
    object{forme_upercule3}

}
    
    
    
    
//--------------------------------------------------------------------------
object{ Segment_of_CylinderRing( 0.97, // major radius,
                                 0.93, // minor radius,  
                                 0.10, // height H,
                                 360  // angle (in degrees)  
                               ) //-----------------------------------------
         texture { T_Chrome_3A
                   //normal { bumps 0.5 scale 0.15} 
                   finish { phong 1}
                 } // end of texture 

        
        
        scale <1,1,1> rotate<0,0,0> translate<0,5.3,0>
      } // end of object
//--------------------------------------------------------------------------
object{ Segment_of_CylinderRing( 1, // major radius,
                                 0.97, // minor radius,  
                                 0.13, // height H,
                                 360  // angle (in degrees)  
                               ) //-----------------------------------------
        texture { T_Chrome_3A
                   //normal { bumps 0.5 scale 0.15} 
                   finish { phong 1}
                 } // end of texture 

        scale <1,1,1> rotate<0,0,0> translate<0,5.4,0>
      } // end of object
//--------------------------------------------------------------------------

     

}


#declare forme_upercule = 


    intersection{
        box { <-0.5,-0.05, -0.8>, <0.5, 0.05, 0.8> 
              texture { T_Chrome_3A
                   //normal { bumps 0.5 scale 0.15} 
                   finish { phong 1 ambient 0.8}
                 } // end of texture 

                rotate<0,0,0> scale 0.5 translate<0,0,0>
            }  
    
        sphere { <0,0,0>, 0.36 
            texture { T_Chrome_3A
                   //normal { bumps 0.5 scale 0.15} 
                   finish { phong 1}
                 } // end of texture 
          scale<0.8,1,1>  rotate<0,0,0>  translate<0,0,0>  
       }  // end of sphere ----------------------------------- 


} 



#declare forme_upercule2 = 


    intersection{
        box { <-0.5,-0.05, -0.8>, <0.5, 0.05, 0.8> 
               texture { T_Chrome_3A
                   //normal { bumps 0.5 scale 0.15} 
                   finish { phong 1}
                 } // end of texture 

                rotate<0,0,0> scale 0.5 translate<0,0,0>
            }  
    
        sphere { <0,0,0>, 0.36 
            texture { T_Chrome_3A
                   //normal { bumps 0.5 scale 0.15} 
                   finish { phong 0.5}
                 } // end of texture 
          scale<0.7,1,1>  rotate<0,0,0>  translate<0,0,0>  
       }  // end of sphere ----------------------------------- 


} 

#declare upercule = difference{
    object{forme_upercule}
    object{forme_upercule2 rotate<0,90,0> scale <0.45,2,0.5> translate<0,0,0.17>}

}




object{
    can
    scale<1,0.8,1>
    translate<20,15,10>
}

object{
 upercule
 scale<1,1,1>
 translate<20,19.25,10.3>
}


object{ Segment_of_CylinderRing( 0.97, // major radius,
                                     0.0, // minor radius,  
                                     0.10, // height H,
                                     360  // angle (in degrees)  
                                   ) //-----------------------------------------
          
                      texture { T_Chrome_3A
                       //normal { bumps 0.5 scale 0.15} 
                       finish { 
                            phong 1
                            ambient 0.8
      
                                              }
                     } // end of texture 
    
                   
            scale <1,1,1> rotate<0,0,0> translate<0,5.2,0>
          } //
          
          
object{forme_upercule3}          