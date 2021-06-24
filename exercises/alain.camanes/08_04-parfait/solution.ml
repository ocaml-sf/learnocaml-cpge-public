(* type 'a bin = Feuille | Nd of ('a bin) * 'a * ('a bin);; *)
let rec est_parfait a =
  let rec aux a =
    match a with
    | Feuille -> 0, true
    | Nd (ag, e, ad) ->
      let (hg, bg) = aux ag and
	  (hd, bd) = aux ad in
      if (bg && hd == hg) then (1+hg, bd)
      else if (bg && bd && hd = hg-1) then (1+hg, false)
      else if (not bg && bd && hd = hg-1) then (1+hg, false)
      else (-1, false)
  in let (h, b) = aux a in (h <> -1);;

(* let tex = *)
  (* Nd ( *)
    (* Nd( *)
      (* Nd(Feuille, 4, Feuille), *)
      (* 2, *)
      (* Nd(Feuille, 5, Feuille) *)
    (* ), *)
    (* 1, *)
    (* Nd( *)
      (* Feuille, *)
      (* 3, *)
      (* Nd(Feuille, 6, Feuille)) *)
  (* );; *)

(* est_parfait tex;; *)
