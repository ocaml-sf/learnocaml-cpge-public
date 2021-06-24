let est_trie a =
  let test = ref true and i = ref 0 in
  while (!i < Array.length a - 1) && !test do
    if a.(!i) > a.(!i+1) then test := false;
    i := !i+1;
  done;
  !test
