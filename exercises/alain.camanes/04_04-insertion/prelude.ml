let echange tab i j =
  let valeur = tab.(i) in
  tab.(i) <- tab.(j);
  tab.(j) <- valeur;;

