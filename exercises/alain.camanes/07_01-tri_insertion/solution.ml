let rec insert a l = match l with
    [] -> [a]
  | h::_ when h = a -> l
  | h::l when h > a -> a::h::l
  | h::l -> h::(insert a l)
;;

let rec sort l = match l with
    [] -> []
  | h::l -> insert h (sort l)
;;
