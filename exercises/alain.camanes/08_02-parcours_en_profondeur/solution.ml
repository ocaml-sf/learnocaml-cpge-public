(* type 'a bin = Feuille | Nd of ('a bin) * 'a * ('a bin) *)
(* let a = *)
  (* (Nd *)
     (* (Feuille, *)
      (* 5, *)
      (* Nd ( *)
	(* Nd ( *)
	  (* Nd (Feuille, 4, Feuille), *)
	  (* 9, *)
	  (* Feuille), *)
	(* 6, *)
	(* Nd ( *)
	  (* Feuille, *)
	  (* 1, *)
	  (* Nd (Feuille, 3, Feuille))))) *)
  
let rec liste_prefixe arbre =
    match arbre with
    | Feuille -> []
    | Nd (a1, e, a2) ->
      let l1 = liste_prefixe a1
      and l2 = liste_prefixe a2 in
      e :: l1 @ l2;;

(* liste_prefixe a;; *)

let rec liste_postfixe arbre =
    match arbre with
    | Feuille -> []
    | Nd (a1, e, a2) ->
      let l1 = liste_postfixe a1
      and l2 = liste_postfixe a2 in
      l1 @ l2 @ [e];;

(* liste_postfixe a;; *)

let rec liste_infixe arbre =
    match arbre with
    | Feuille -> []
    | Nd (a1, e, a2) ->
      let l1 = liste_infixe a1
      and l2 = liste_infixe a2 in
      l1 @ [e] @ l2;;

(* liste_infixe a;; *)
