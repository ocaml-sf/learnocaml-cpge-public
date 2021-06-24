let somme_inverses n =
  let s = ref 0. in
    for i = n downto 1 do
      s := !s +. 1. /. (float_of_int i)
    done;
  !s
