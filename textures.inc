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
