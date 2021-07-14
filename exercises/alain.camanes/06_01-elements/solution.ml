let rec dernier_element l =
  match l with
  | [] -> failwith "Liste vide"
  | [t] -> t
  | t :: q -> dernier_element q;;

let rec somme l =
  match l with
  | [] -> 0
  | t :: q -> t + (somme q);;

let rec est_present x l =
  match l with
  | [] -> false
  | t::q -> (t = x) || (est_present x q);;
