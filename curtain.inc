// CURTAIN include file
// GEMELLI David
// 26/01/1999

// Parametres:
// NbMax = 5; // nb ondulations
// Coef1 = 2; // max size along X
// Step = 1;  // max step between 2 ondulations
// Rings = 1; // add rings ?
// Tex_Rings = texture {pigment {color Sienna}}
// Tex_Curtain = texture {pigment {rgbt<1, 1, 1, 0.5>}}
// CURTAIN_FLATNESS = 0.1; // bicubic_patch flatness

// return values
// Rod_Y      // height of the rod you can add (=0.25)
// Rod_Radius // radius of the rod (=0.15)
// Rod_Min_Z  // end of the curtain

#ifndef(NbMax)
     #declare NbMax = 5;
#end
#ifndef(Coef1)
     #declare Coef1 = 2;
#end
#ifndef(Step)
     #declare Step = 1;
#end
#ifndef(CURTAIN_FLATNESS)
     #declare CURTAIN_FLATNESS = 0.1;
#end
#ifndef(Tex_Rings)
     #declare Tex_Rings = texture {pigment {color Sienna}}
#end
#ifndef(Tex_Curtain)
     #declare Tex_Curtain = texture {pigment {rgbt<1, 1, 1, 0.5>}}
#end

#declare Curtain =
union {
#local Current = 0;
#local OldX = 0;
#local OldZ = 0;
#local Val = 0.25;
#local Seed0 = seed(15734);
#ifdef(Rings)
     #if (Rings = 1)
          torus {
               0.5, 0.05
               rotate <90, 0, 0>
               translate <0, 0, OldZ>
               texture {Tex_Rings}
          }
     #end
#else
     #declare Rings = 0;
#end
#while (Current < NbMax * 2)
     #local T0 = (1+rand(Seed0)) * Coef1 * sin(radians(Val * 360));
     #local Step_ = (1+rand(Seed0)) * Step;
     #local T1 = Step_ / 3;
     bicubic_patch {
          type 1
          flatness CURTAIN_FLATNESS
          u_steps 3
          v_steps 3
          <0,-.2,OldZ>,<T0,-.2,OldZ+T1>,<T0,-.2,OldZ+(2*T1)>,<0,-.2,OldZ+Step_>,
          <0,-10,OldZ>,<T0,-10,OldZ+T1>,<T0,-10,OldZ+(2*T1)>,<0,-10,OldZ+Step_>,
          <0,-20,OldZ>,<T0,-20,OldZ+T1>,<T0,-20,OldZ+(2*T1)>,<0,-20,OldZ+Step_>,
          <0,-30,OldZ>,<T0,-30,OldZ+T1>,<T0,-30,OldZ+(2*T1)>,<0,-30,OldZ+Step_>
     }
     #if (Rings = 1)
          #local Rot_Angle = atan2(T0-OldX, (OldZ+Step_)-OldZ);
          torus {
               0.5, 0.05
               rotate <90, 0, 0>
               rotate <0, -degrees(Rot_Angle) / 4, 0>
               translate <0, 0, OldZ+Step_>
               texture {Tex_Rings}
          }
     #end
     #local Current = Current + 1;
     #local OldX = T0;
     #local OldZ = OldZ + Step_;
     #local Val = mod(Val + 0.5, 1);
#end
     texture {Tex_Curtain}
}

#declare Rod_Y = 0.25;
#declare Rod_Radius = 0.15;
#declare Rod_Min_Z = OldZ + Step_;
