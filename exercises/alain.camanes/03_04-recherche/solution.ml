let recherche_dichotomique tab el =
  let g = ref 0
  and d = ref (Array.length tab - 1)
  and f = ref false
  in
  while (!g <= !d) && (not !f) do
    let m = (!g + !d) / 2 in
    print_int m; print_int !g; print_int !d;
    if tab.(m) = el then f := true
    else if tab.(m) < el then
      g := m+1
    else d := m-1
  done;
  !f
