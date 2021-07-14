open Test_lib
open Report

let tex =
  Nd (
    Nd(
      Nd(Feuille, 4, Feuille),
      2,
      Nd(Feuille, 5, Feuille)),
    1,
    Nd(
      Nd(Feuille, 6, Feuille),
      3, Feuille))

let stex1 =
  Nd(Feuille, 4, Feuille)

let stex2 =
  Nd(
    Nd(Feuille, 6, Feuille),
    3,
    Feuille
  )

let nstex =
  Nd(
    Nd(
      Nd(Feuille, 6, Feuille),
      4, Feuille),
     2,
     Nd(Feuille, 5, Feuille))

let inclustex =
  Nd(Feuille,
     2,
     Nd(Feuille, 5, Feuille))
    
let sample_int_tree () =
  let rec builder h = match h with
    | 0 -> Feuille
    | n -> match Random.int 3 with
      | 0 -> Feuille
      | _ -> Nd (builder (h-1), Random.int 10, builder (h-1))
  in
  let h = Random.int 5 + 2 in
  builder h

let exercise_1 =
  Section ([ Text "Question 1: " ; Code "est_sous_arbre" ],
	   test_function_2_against_solution
	     [%ty: int bin -> int bin -> bool]
	     "est_sous_arbre"
	     ~sampler:(fun () ->  (sample_int_tree (), sample_int_tree ()))
	     ~gen:0
 	     [(Feuille, tex) ;
	      (tex, Feuille) ;
	      (stex1, tex) ;
	      (stex2, tex) ;
	      (nstex, tex) ;
	     ]
  )

let exercise_2 =
  Section ([ Text "Question 1: " ; Code "est_inclus" ],
	   test_function_2_against_solution
	     [%ty: int bin -> int bin -> bool ]
	     "est_inclus"
	     ~sampler:(fun () -> (sample_int_tree (), sample_int_tree ()))
	     ~gen:0
	     [(Feuille, tex) ;
	      (tex, Feuille) ;
	      (stex1, tex) ;
	      (stex2, tex) ;
	      (nstex, tex) ;
	      (inclustex, tex) ;
	     ]
  )

let () =
  set_result @@
  ast_sanity_check code_ast @@ fun () ->
  [exercise_1; exercise_2]
