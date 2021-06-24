open Test_lib
open Report

let exercise_1 =
  Section ([ Text "Question 1: " ; Code "dernier_element" ],
	   test_function_1_against_solution
	     [%ty: int list -> int]
	     "dernier_element"
	     ~gen:4
	     [[]]
  )

let exercise_2 =
  Section ([ Text "Question 2: " ; Code "somme" ],
	   test_function_1_against_solution
	     [%ty: int list -> int]
	     "somme"
	     ~gen:4
	     [[]]
  )

let exercise_3 =
  Section ([ Text "Question 3: " ; Code "est_present" ],
	   test_function_2_against_solution
	     [%ty: int -> int list -> bool]
	     "est_present"
	     ~gen:6
	     [(3, []);
	      (1, [1;2;3]);
	      (1, [2;3;1]);
	      (4, [1;2;3])]
  )

    
let () =
  set_result @@
  ast_sanity_check code_ast @@ fun () ->
    [exercise_1 ; exercise_2 ; exercise_3 ]
