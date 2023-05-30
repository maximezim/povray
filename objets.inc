#declare Room = box { <0, 0, 0>, <500, 300, 700> }

#declare Sol = plane { y, 1 }

#declare sofa = union {
  box { <0, 0, 0>, <100, 70, 80> }
  box { <0, 0, 80>, <100, 70, 160> }
  box { <0, 0, 160>, <100, 70, 240> }
  box { <0, 0, 240>, <100, 70, 320> }
}

// #declare plaintes = union {
    
// }