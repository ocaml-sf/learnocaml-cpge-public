(* type 'a bin = Feuille | Nd of ('a bin) * 'a * ('a bin) *)

let rec est_sous_arbre t1 t2 =
  match t2 with
  | Feuille -> (t1 = Feuille)
  | Nd (tg, r, td) -> t1 = t2 ||
                     est_sous_arbre t1 tg ||
                     est_sous_arbre t1 td;;

let rec est_inclus t1 t2 =
  match (t1, t2) with
  | (Feuille, t2) -> true
  | (_, Feuille) -> false
  | Nd (t1g, r1, t1d), Nd (t2g, r2, t2d) ->
    ((r1 = r2 &&
	coincide t1g t2g &&
	coincide t1d t2d)
     || est_inclus t1 t2g
     || est_inclus t1 t2d)
and coincide t1 t2 = match (t1, t2) with
  | Feuille, t2 -> true
  | _, Feuille -> false
  | Nd (t1g, r1, t1d), Nd (t2g, r2, t2d) ->
    (r1 = r2
    && coincide t1g t2g
    && coincide t1d t2d
    );;

(* let tex = *)
  (* Nd ( *)
    (* Nd( *)
      (* Nd(Feuille, 4, Feuille), *)
      (* 2, *)
      (* Nd(Feuille, 5, Feuille) *)
    (* ), *)
    (* 1, *)
    (* Nd( *)
      (* Nd(Feuille, 6, Feuille), *)
      (* 3, *)
      (* Feuille) *)
  (* );; *)

(* let stex1 = *)
  (* Nd(Feuille, 4, Feuille);; *)

(* let stex2 = *)
      (* Nd( *)
	(* Nd(Feuille, 6, Feuille), *)
	(* 3, *)
	(* Feuille *)
      (* ) *)

(* let nstex = *)
  (* Nd( *)
    (* Nd( *)
      (* Nd(Feuille, 6, Feuille), *)
      (* 4, *)
      (* Feuille), *)
     (* 2, *)
     (* Nd(Feuille, 5, Feuille)) *)

(* let inclustex = *)
  (* Nd(Feuille, *)
     (* 2, *)
     (* Nd(Feuille, 5, Feuille));; *)

(* est_inclus stex2 tex;; *)
