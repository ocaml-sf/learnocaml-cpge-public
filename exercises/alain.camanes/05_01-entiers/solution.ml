let rec add_entiers n m =
  match n with
  | Zero -> m
  | S k -> add_entiers k (S m)
