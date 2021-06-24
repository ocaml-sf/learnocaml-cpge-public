let present a elt =
  let test = ref false and i = ref 0 in
  while not !test && !i <= Array.length a - 1 do
    (if a.(!i) = elt then test := true);
    i := !i + 1;
  done;
  !test

let inclus a1 a2 =
  let test = ref true and i = ref 0 in
  while !test && !i < Array.length a1 do
    (if not (present a2 a1.(!i)) then test := false);
    i := !i + 1;
  done;
  !test

let meme_support t1 t2 =
  inclus t1 t2 && inclus t2 t1
