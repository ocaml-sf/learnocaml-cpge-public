(* let tab = [|12;0;-1;10;12;1;0|];; *)

(* let echange tab i j = *)
  (* let valeur = tab.(i) in *)
  (* tab.(i) <- tab.(j); *)
  (* tab.(j) <- valeur;; *)

let mini tab i =
  let ilocal = ref i in
  for j = !ilocal+1 to (Array.length tab - 1) do
    if tab.(j) < tab.(!ilocal) then
      ilocal := j;
    done; !ilocal;;

let tri_selection tab =
  for i = 0 to (Array.length tab - 1) do
    let imin = mini tab i in
    echange tab i imin;
  done;;

(* tri_selection tab;; *)
(* tab;; *)
