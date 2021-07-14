let min3 a b c =
  let (aa, bb) =
    if a < b then (a,b) else (b,a) in
  if aa < c then aa else c
