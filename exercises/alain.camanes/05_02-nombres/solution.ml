let rec add_nombre x y =
  match x, y with
  | Entier n, Entier m -> Entier (n + m)
  | Flottant s, Flottant t -> Flottant (s +. t)
  | Entier n, Flottant t -> Flottant ((float_of_int n) +. t)
  | Flottant t, Entier n -> add_nombre y x
