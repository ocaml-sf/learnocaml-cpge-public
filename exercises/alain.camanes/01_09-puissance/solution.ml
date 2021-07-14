let rec puissance x n =
  match n with
    | 0 -> 1
    | _ -> x * (puissance x (n-1))
