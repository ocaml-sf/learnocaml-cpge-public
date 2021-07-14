let rec mappe f l =
  match l with
  | [] -> []
  | t::q -> (f t) :: (mappe f q);;
