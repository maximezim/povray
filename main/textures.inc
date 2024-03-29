#declare murs = texture {
  // beige assez pâle
  pigment { color rgb <.9,.9,.8> }
  // finition mate
  finish { diffuse 0.7 }

}


#declare planche = texture {
  pigment
  { wood color_map { [0 rgb <.9,.7,.3>][1 rgb <.8,.5,.2>] }
    turbulence .5
    scale <1, 1, 20>*30
  }
  finish { specular 0.5 }
  normal
  { gradient x 1
    slope_map
    { [0 <0, 1>] // 0 height, strong slope up
      [.05 <1, 0>] // maximum height, horizontal
      [.95 <1, 0>] // maximum height, horizontal
      [1 <0, -1>] // 0 height, strong slope down
    }
  }
}

#declare beige_wall = texture {
  pigment {
    color rgb <0.9, 0.8, 0.6>
  }
  finish {
            diffuse 0.9
            specular 0.1
            roughness 1e-3
        }
  normal {
    bumps 0.2
    scale 0.5
    octaves 6
    turbulence 0.5
  }
  scale <1,1,1>*100
}

#declare sofa_texture = texture {
  pigment { color rgb <0.8, 0.6, 0.4> }
  finish {
    ambient 0.2
    diffuse 0.4
    specular 0.5
    reflection 0.1
  }
}

#declare woodtable = texture{
  pigment{
    image_map{
      png "../textures/Wood002_1K_Color.png"
    }
    scale <1,1,1>*100
  }
  normal {
    bump_map {
      png "../textures/Wood002_1K_Displacement.png"
    }
    scale <1,1,1>*100
  }
  finish {
    ambient 0.2
    diffuse 0.4
    specular 0.5
  }
}

#declare meubletele = texture{
  pigment{
    image_map{
      png "../textures/meubletele_color.png"
    }
    scale <1,1,1>*130
  }
  normal {
    bump_map {
      png "../textures/meubletele_bump.png"
    }
    scale <1,1,1>*130
  }
  finish {
    ambient 0.2
    diffuse 0.4
    specular 0.5
  }
}


#declare ecran_tele = material {
    texture{ 
        pigment {
            image_map {
                png "../textures/tele.png"
                map_type 0 once
            }
            scale <118, 58, 1>
        }
        finish {
            emission 0.9
        }
    }
}