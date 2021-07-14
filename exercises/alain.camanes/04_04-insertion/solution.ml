(* let tab = [|12;0;-1;10;12;1;0|];; *)
(*
let echange tab i j =
  let valeur = tab.(i) in
  tab.(i) <- tab.(j);
  tab.(j) <- valeur;;
*)

let tri_partiel tab i =
  let j = ref i in
  while !j > 0 && tab.(!j) < tab.(!j-1) do
    echange tab (!j-1) !j;
    j := !j - 1;
  done;;

let tri_insertion tab =
  for i = 1 to (Array.length tab - 1) do
    tri_partiel tab i;
  done;;

(* tri_insertion tab;; *)
(* tab;; *)
