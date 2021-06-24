let rec dichotomie f a b eps =
  if b -. a < eps then a
  else let c = (a +. b) /. 2. in
  if f(c) *. f(a) > 0. then dichotomie f c b eps
  else dichotomie f a c eps
