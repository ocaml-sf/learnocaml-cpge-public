let est_parfait n =
  let s = ref 0 in
  for i = 1 to n-1 do
    if n mod i = 0 then s := !s + i
  done;
  !s = n
