let rec cheminement a =
  let rec aux a p =
  match a with
    | Feuille -> p
    | Nd (b, _, c) -> aux b (p+1) + aux c (p+1)
  in aux a 0;;
