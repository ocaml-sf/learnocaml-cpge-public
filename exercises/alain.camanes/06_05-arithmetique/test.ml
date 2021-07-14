open Test_lib
open Report

let sampler_1 () = Random.int 167 + 2;;
let sampler_2 () = Random.int 500;;

let exercise_1 =
  Section ([ Text "Question 1: " ; Code "diviseurs_premiers" ],
	   test_function_1_against_solution
	     [%ty: int -> int list]
	     "diviseurs_premiers"
	     ~sampler:(fun () -> sampler_1 ())
	     ~gen:5
	     []
  )
    
let exercise_2 =
  Section ([ Text "Question 2: " ; Code "base" ],
	   test_function_1_against_solution
	     [%ty: int -> int list]
	     "base"
	     ~sampler:(fun () -> sampler_2 ())
	     ~gen:4
	     [0]
  )

let () =
  set_result @@
  ast_sanity_check code_ast @@ fun () ->
    [exercise_1 ; exercise_2]
