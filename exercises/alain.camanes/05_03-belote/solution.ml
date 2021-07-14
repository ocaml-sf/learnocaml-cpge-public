let point atout ca =
  match ca with
  | (_, Sept) -> 0
  | (_, Huit) -> 0
  | (_, Dix) -> 10
  | (_, Dame) -> 3
  | (_, Roi) -> 4
  | (_, As) -> 11
  | (c, Neuf) -> if c = atout then 14 else 0
  | (c, Valet) -> if c = atout then 20 else 2
;;

let rec pli atout p =
  match p with
  | [] -> 0
  | h::q -> (point atout h) + (pli atout q)
;;
