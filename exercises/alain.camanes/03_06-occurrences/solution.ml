let occurrences a elt =
  let cpt = ref 0 in
  for i = 0 to Array.length a-1 do
    if a.(i) = elt then cpt := !cpt+1;
  done;
  !cpt
