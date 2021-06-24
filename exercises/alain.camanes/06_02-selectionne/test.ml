open Test_lib
open Report

let exercise_1 =
  Section ([ Text "Question 1: " ; Code "supprime" ],
	   test_function_2_against_solution
	     [%ty: int -> int list -> int list]
	     "supprime"
	     ~gen:4
	     [(0, [])]
  )

let exercise_2 =
  Section ([ Text "Question 2: " ; Code "unsurdeux" ],
	   test_function_1_against_solution
	     [%ty: int list -> int list]
	     "unsurdeux"
	     ~gen:4
	     [[]]
  )

let exercise_3 =
  Section ([ Text "Question 3: " ; Code "tricime" ],
	   test_function_1_against_solution
	     [%ty: int list -> int list]
	     "tricime"
	     ~gen:4
	     [[]]
  )

    
let () =
  set_result @@
  ast_sanity_check code_ast @@ fun () ->
    [exercise_1 ; exercise_2 ; exercise_3]
