let rec nb_feuilles_foret foret =
  match foret with
  | [] -> 0
  | Noeud(_, [])::q -> 1 + nb_feuilles_foret q
  | Noeud(_,l)::q -> nb_feuilles_foret l + nb_feuilles_foret q;;

let nb_feuilles arbre =
  nb_feuilles_foret [arbre];;

let hauteur arbre =
  let rec aux foret =
    match foret with
    | [] -> 0
    | Noeud(_, [])::q -> aux q
    | Noeud(_, a)::q -> max (1 + aux a) (aux q)
  in aux [arbre];;

let arbre_vers_binaire arbre =
  let rec aux foret =
    match foret with
    | [] -> Feuille
    | Noeud(a,l)::q -> Nd (aux l, a, aux q)
  in aux [arbre];;
