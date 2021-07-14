let rec existe_multiple_inferieur n r =
  if r = 1 then false
  else if n mod r = 0 then true
  else existe_multiple_inferieur n (r-1)


let est_premier n  =
  if n = 1 then false
  else not (existe_multiple_inferieur n (n-1))
