let rec sum x y =
  if x = 0 then y else
    (if x < 0 then - (sum (-x) (-y))
     else 1 + sum (x - 1) y)
