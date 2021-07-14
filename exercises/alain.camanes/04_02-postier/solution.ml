(* let liste = [|(10, "hello"); (1, "salut"); (0, "bonjour"); (9, "Buenos dias"); (0, "salut")|] *)

let denombrement m tab =
  let occ = Array.make m 0 in
  for i = 0 to (Array.length tab - 1) do
    let adresse, lettre = tab.(i) in
    occ.(adresse) <- occ.(adresse) + 1
  done;
  occ;;

(* denombrement 11 liste;; *)

let place m tab =
  let position = Array.make m 0 and
      occ = denombrement m tab in
  for i = 1 to (m - 1) do
    position.(i) <- position.(i-1) + occ.(i-1)
  done;
  position;;

(* place 11 liste;; *)

let tri_postier m tab =
  let position = place m tab and
      aux = Array.make m tab.(0) in
  for i = 0 to (Array.length tab - 1) do
    let adresse, lettre = tab.(i) in
    aux.(position.(adresse)) <- tab.(i);
    position.(adresse) <- position.(adresse) + 1
  done;
  for i = 0 to (Array.length tab - 1) do
    tab.(i) <- aux.(i)
  done;;

(* tri_postier 11 liste;; *)

(* liste;; *)
