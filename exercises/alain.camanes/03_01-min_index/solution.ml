let min_index a =
  let m = ref a.(0) and im = ref 0 in
  for i = 1 to Array.length a - 1 do
    if a.(i) < !m then (m := a.(i); im := i)
  done;
  !im
