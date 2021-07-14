let est_premier n =
  let test = ref true and i = ref 2 in
  (* test = {pourtout 1 < j <= i, j ne divise pas n *) 
  while !test = true && !i * !i <= n  do
    if n mod !i = 0 then test := false;
    i := !i + 1;
  done;
  !test
