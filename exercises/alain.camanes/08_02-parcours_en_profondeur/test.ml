open Test_lib
open Report

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
  Section ([ Text "Question 1: " ; Code "liste_prefixe" ],
	   test_function_1_against_solution
	     [%ty: int bin -> int list]
	     "liste_prefixe"
	     ~sampler:(fun () ->  sample_int_tree ())
	     ~gen:5
	     []
  )

let exercise_2 =
  Section ([ Text "Question 2: " ; Code "liste_postfixe" ],
	   test_function_1_against_solution
	     [%ty: int bin -> int list]
	     "liste_postfixe"
	     ~sampler:(fun () ->  sample_int_tree ())
	     ~gen:5
	     []
  )
    
let exercise_3 =
  Section ([ Text "Question 3: " ; Code "liste_infixe" ],
	   test_function_1_against_solution
	     [%ty: int bin -> int list]
	     "liste_infixe"
	     ~sampler:(fun () ->  sample_int_tree ())
	     ~gen:5
	     []
  )

let () =
  set_result @@
  ast_sanity_check code_ast @@ fun () ->
  [exercise_1 ; exercise_2 ; exercise_3]
