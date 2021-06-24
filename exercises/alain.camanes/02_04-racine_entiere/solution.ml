let racine_entiere n =
  let i = ref 0 in
  while !i * !i <= n do
    i := !i + 1
  done;
  !i-1
