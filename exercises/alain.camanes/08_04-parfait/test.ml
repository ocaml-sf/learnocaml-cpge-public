open Test_lib
open Report

let parfait =
  Nd (
    Nd(
      Nd(Feuille, 4, Feuille),
      2,
      Nd(Feuille, 5, Feuille)
    ),
    1,
    Nd(
      Nd(Feuille, 6, Feuille),
      3,
      Feuille));;

let nonparfait =
  Nd (
    Nd(
      Nd(Feuille, 4, Feuille),
      2,
      Nd(Feuille, 5, Feuille)
    ),
    1,
    Nd(
      Feuille,
      3,
      Nd(Feuille, 6, Feuille)));;


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
  Section ([ Text "Question 1: " ; Code "est_parfait" ],
	   test_function_1_against_solution
	     [%ty: int bin -> bool]
	     "est_parfait"
	     ~sampler:(fun () ->  sample_int_tree ())
	     ~gen:0
	     [parfait ; nonparfait]
  )

let () =
  set_result @@
  ast_sanity_check code_ast @@ fun () ->
  [exercise_1]
