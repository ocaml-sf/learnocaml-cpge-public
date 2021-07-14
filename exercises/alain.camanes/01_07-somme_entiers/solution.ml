let rec somme_entiers n =
  if n < 0 then - (somme_entiers (-n)) else
    match n with
    | 0 -> 0
    | _ -> n + somme_entiers (n - 1)
      
