let class3 x y z =
  let (xx, yy) =
    if x <= y then (x, y) else (y, x) in 
  if z >= yy then (xx, yy, z)
  else
    if z <= xx then (z, xx, yy)
    else (xx, z, yy)
