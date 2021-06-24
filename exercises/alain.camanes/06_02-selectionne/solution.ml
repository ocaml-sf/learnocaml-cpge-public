let rec supprime a l =
  match l with
  | [] -> []
  | t::q when t = a -> supprime a q
  | t::q -> t::(supprime a q);;

let rec unsurdeux l =
  match l with
  | [] -> []
  | [t] -> [t]
  | t0::t1::q -> t0::(unsurdeux q);;

let rec tricime l =
  match l with
  | [] -> []
  | [a] -> [a]
  | t0::t1::[] -> [t0]
  | t0::t1::t2::q -> t0::(tricime q);;
